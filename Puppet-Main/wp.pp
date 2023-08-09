# new account wordpress for ubuntu
accounts::user { 'sdkjqg':
  uid     => '4001',
  gid     => '4001',
  shell   => '/bin/bash',
  password => 'soy3Salud',
  locked  => false,
}
# installation apache service
class { 'apache':
  mpm_module    => 'prefork',
  default_vhost => false,
}

# installation php module
class { 'apache::mod::php':
  package_name => 'php',
}

# creation virtual for blog
apache::vhost { 'wordpressBlog':
  servername      => 'wordpressBlog',
  port            => 8081,
  docroot         => '/var/www/wordpress',
  docroot_owner   => 'wp',
  docroot_group   => 'wp',
}

# installation packages needed for wordpress
package { ['php-mysql', 'php-curl', 'php-gd', 'php-mbstring', 'php-xml', 'php-xmlrpc', 'php-soap']:
  ensure => 'installed',
}

# installation MySql Server
class { 'mysql::server':
  root_password             => 'strongpassword',
  remove_default_accounts   => true,
  restart                   => true,
}

# user mysql - wordpress
mysql::db { 'wp_db':
  user     => 'wp_db_user',
  password => 'noMoreUnsecureAdminUser1234',
  host     => 'localhost',
  grant    => ['ALL'],
}

# installation of the wordpress module
class { 'wordpress':
  settings => {
    'localhost' => {
      wproot        => '/var/www/wordpress',
      owner         => 'wp',
      dbhost        => 'localhost',
      dbname        => 'wp_db',
      dbuser        => 'wp_db_user',
      dbpasswd      => 'noMoreUnsecureAdminUser1234',
      wpadminuser   => 'wp_user_1',
      wpadminpasswd => 'noMoreUnsecureAdminUser678',
      wpadminemail  => 'sdkjqg@gmail.com',
      wptitle       => 'Actividad: Instalación completa de WordPress con Puppet',
    },
  },
}


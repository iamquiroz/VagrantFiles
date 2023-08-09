#modules/apache/init.pp

class apache{
package {'apache2':
ensure => 'installed',

}
service {
ensure=> 'running',
enable => true,

}
}

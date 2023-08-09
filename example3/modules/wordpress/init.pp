#modules/wordpress/init.pp

class wordpress{
file{'/var/www/html/index.php':
	ensure=>'file',
	content=> 
	template('wordpress/index.php.erb'),
	require => Package['php'],
}
}

	file{'/var/www/html/index.php':
		ensure=>'file',
		content=>template('wordpress/index.php.erb')
		require=> Package['php'],

	}

		file{'var/www/html/index.php':
			ensure=>'file',
			content=>template('wordpress/index.php.erb'),
			require=>Package['php']
		}

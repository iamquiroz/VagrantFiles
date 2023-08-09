#modules/php/init.pp

class php{
package {'php':
	ensure=>'installed',

}

	package {'php-mysql':
		ensure=>'installed',
	}
		
		
	
		}

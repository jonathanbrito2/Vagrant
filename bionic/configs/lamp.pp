# execute 'apt-update'
exec { 'apt-update':                    # exec resource named 'apt-update'
  command => '/usr/bin/apt-get update'  # command this resource will run
}


package { ['php7.2', 'php7.2-mysql']:
  require => Exec['apt-update'],        # require 'apt-update' before installing
  ensure => installed,
}

exec { 'run-php7': 
  require => Package['php7.2'],
  command => '/usr/bin/php -S 192.168.0.117:8888 -t /vagrant/src &'  # command this resource will run
}


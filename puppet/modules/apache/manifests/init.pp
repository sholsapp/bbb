class apache {
  package {'apache2':
    ensure => installed,
    before => File['/etc/apache2/apache2.conf'],
  }
  file {'/etc/apache2/apache2.conf':
    ensure  => file,
    owner   => 'root',
    source => 'puppet:///modules/apache/apache2.conf',
  }
  service {'apache2':
    ensure    => running,
    enable    => true,
    subscribe => File['/etc/apache2/apache2.conf'],
  }
}


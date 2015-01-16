class builder {

  $packages = [
    'bc',
    'build-essential',
    'device-tree-compiler',
    'fakeroot',
    'lzma',
    'lzop',
    'man-db',
    'libncurses5-dev:armhf',
    'bison',
    'flex',
  ]

  package { $packages:
    ensure => installed,
  }

  file { '/etc/init.d/capemgr-debian.sh':
    ensure => file,
    mode   => 755,
    source => 'puppet:///modules/builder/capemgr-control',
  }

  file { '/etc/capemgr':
    ensure => file,
    source => 'puppet:///modules/builder/capemgr',
  }

}


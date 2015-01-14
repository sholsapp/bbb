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

  file {'/home/ubuntu/workspace':
    ensure => directory,
  }

  vcsrepo {'/home/ubuntu/workspace/dotfiles':
    ensure => present,
    provider => git,
    source => 'https://github.com/sholsapp/dotfiles.git',
  }

  File['/home/ubuntu/workspace'] -> Vcsrepo['/home/ubuntu/workspace/dotfiles']

}


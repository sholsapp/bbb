class builder {

  $packages = [
    'vim',
    'screen',
  ]

  package { $packages:
    ensure => installed,
  }

  file { '/home/ubuntu/.gitconfig':
    ensure => file,
    source => 'puppet:///modules/personal/gitconfig',
  }

  file {'/home/ubuntu/workspace':
    ensure => directory,
  }

  vcsrepo {'/home/ubuntu/workspace/dotfiles':
    ensure   => present,
    provider => git,
    source   => 'https://github.com/sholsapp/dotfiles.git',
  }

  exec { 'installer':
    command => 'installer',
    path    => [
      '/home/ubuntu/workspace/dotfiles'
    ],
  }

  File['/home/ubuntu/workspace']
  -> Vcsrepo['/home/ubuntu/workspace/dotfiles']
  -> Exec['installer']

}


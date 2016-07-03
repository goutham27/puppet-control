class filedemo {
  file { '/root/motd':
    ensure   => present,
    content  => 'im a devops engineer',
    owner    => root,
    group    => root,
    mode     => '0644',
  }

  file { '/etc/motd':
    ensure => link,
    target => '/root/motd',
  }
 
}

define apache::vhost ($port, $document_root, $server_name, $vhost_name = '*', $vhost_dir) {
  
  File {
    ensure => file,
    mode   => 0677,
  } 

  file { 'index':
    path    => "${document_root}/index.html",
    content => template('apache/index.html.erb'),
    before  => File['config_file'],
  }

  file {'config_file':
    path    => "${vhost_dir}/${servername}.conf",
    content => template('apache/vhost.conf.erb'),
    reqire  => Package['apache'],
    notify  => Service['apache']
  }
}

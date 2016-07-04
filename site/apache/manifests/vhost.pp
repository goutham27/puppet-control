define apache::vhost ($port, $document_root, $server_name, $vhost_name = '*', $vhost_dir) {
  
  file {
    mode => 0677,
  } 

  file { 'index':
    path    => "${document_root}/index.html",
    ensure  => file,
    content => template('apahe/index.html.erb'),
    before  => File['config_file'],
  }

  file {'config_file':
    path    => "${vhost_dir}/${servername}.conf",
    content => template('apache/vhost.conf.erb'),
    reqire  => Package['apache'],
    notify  => Service['apache']
  }
}
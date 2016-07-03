class ntp::file {
  
  $template = $ntp::params::template

  file { '/etc/ntp.conf':
    ensure  => present,
    require => Package['ntp'],
    content => template("ntp/${template}.erb")
  }
}
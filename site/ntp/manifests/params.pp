class ntp::params {
  case $::operatingsystem {
    'ubuntu': {
      $template     = 'ntp_ubuntu.conf'
      $service_name = 'ntp'
    }
    
    'centos' : {
      $template     = 'ntp_centos.conf'
      $service_name = 'ntpd'
    }

    default: {fail('OS $::operatingsystem is not currently supported')}
  }
}
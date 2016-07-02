# class firefox
# this module will install firefox
#
# author = goutham

class firefox ( String $version = '') {
  
  case $::osfamily{

    redhat, debian : { }
    
    windows: {

      package { 'firefox' :
        ensure   => $version,
        provider => 'chocolatey',
      }

      windows_env {'PATH = c:\program files\git\bin':
        ensure => present,
      }
    }

    default: {
      fail("Module ${module_name} is not supported on {::operatng system}")
    }
    
  }
}
# class chrome
# this module will install chrome
#
#author : goutham

class chrome ( String $version = '') {
  case $::osfamily{

    redhat, debian : {
      package{ 'googlechrome' :
        ensure => present,
      }
    }

    windows : {

      package { 'googlechrome' :
        ensure   => $version,
        provider => 'chocolatey',
      }
    
      windows_env {'PATH = c:\program files\git\bin': 
        ensure => present,
      }
    }
    
    default: {
      fail("Module ${module_name} is not supported on {::operatingsystem}")
    }

  }
}
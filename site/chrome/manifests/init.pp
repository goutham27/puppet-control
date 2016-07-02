# class chrome
# this module will install chrome
#
#author : goutham

class chrome ( String $version = '') {
  
  case $::osfamily{

    redhat, debian : { }

    windows : {

      package { 'googlechrome' :
        ensure   => $version,
        provider => 'chocolatey',
      }
    }
    
    default: {
      fail("Module ${module_name} is not supported on {::operatingsystem}")
    }

  }
}
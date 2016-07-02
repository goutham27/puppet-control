#
#

class nodejs (String $version = '') {
  
  case $::osfamily : {
    
    windows : {

      package {'nodejs' :
        ensure   => $version,
        provider => 'chocolatey',
      }

      windows_env {'$PATH = C:\Program files\nodejs' :
        ensure => present,
      }

      windows_env {'$PATH = C:\Users\Vagrant\Appdata\roaming\npm' :
        ensure => present,
      }
	}

	redhat : {
      
      package {'nodejs' :
        ensure => present,
      }

      package{ 'npm' :
        ensure => present,
      }
    }

	default: {
      fail("Module ${module_name} is not supported on {::operatng system}")
    }
  }

} 
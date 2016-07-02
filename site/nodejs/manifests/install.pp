#
#

class nodejs (String $version = '') {
  
  case $::osfamily : {
    
    windows : {

      package {'nodejs' :
        ensure   => $version,
        provider => 'chocoatey',
      
      }

      windows_env {'$PATH = c:\program files\nodejs' :
        ensure => present,
      }

      windows_env {'$PATH = c:\Users\Vagrant\Appdata\roaming\npm' :
        ensure => present,
      }
	}

	redhat : {
      
      package {'nodejs' :
        ensure => present
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
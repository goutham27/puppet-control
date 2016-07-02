# Class git
# This module installs git on windows and linux servers
# 
# author: goutham

class git ( String $version = '') {
  case $::osfamily{

    redhat, debian : {
      package { 'git' :
        ensure => present,
      }
    }

    windows: {

      package{ 'git' :
        ensure   => $version
        provider => 'chocolatey',
      }

      windows_env { 'PATH=c:\program files\git\bin' :
        ensure => present,
      }
    }

    default: {
      fail("Module ${module_name} is not supported on {::operatingsystem}")
    }
  }
}

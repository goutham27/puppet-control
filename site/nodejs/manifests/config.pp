#
class nodejs::config {
  
  case $::osfamily {

    windows : {

      exec { 'set-node-registry' :
        command   => 'npm.cmd config set registry="http://registry.npms.org/"',
        logoutput => true,
        path      => 'c:\program files\nodejs',
        onlyif    => 'npm.cmd config get rgistry | c:\windows\system32\findstr.exe https://registry.npms.org',
      }
    }

    redhat : {

      file {'nodejs-env' :
        ensure   => present,
        path     => '/etc/profile.d/nodejs-env.sh',
        content  => file('nodejs/nodejs-env.sh'),
        mode     => '0755',
      }
    }

    default: {
    	fail("Module ${module_name} is not supported on {::operatngsystem}")
    }
  }
}
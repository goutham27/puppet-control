# class test
#

class test {

  case $::osfamily{

    windows : {
      
      file { 'C:\Temp': ensure => directory, }

      file { 'C:\Utils' : enssure => directory, }

      file { 'C:\git' : ensure => directory, }

      file {'C:\chrome' : ensure => directory, }

      file {'C:\Temp\file.txt':
        ensure  => file,
        content => 'hello  world',
      }

      file {'C:\Utils\file.txt' :
        ensure  => file,
        content => 'hello world',
      }

      file { 'C:\git\file.txt' :
        ensure  => file,
        content => 'hello world',
      }

      file { 'C:\chrome\file.txt':
        ensure  => file,
        content => 'hello world',
      }

      file { 'C:\temp\puppet.txt':
        ensure  => present,
        content => file('test\temp.txt'),
      }

      file { 'C:\Utils\puppet.txt':
        ensure  => present,
        content => file('test\temp.txt'),
      }

      file {'C:\git\puppet.txt',
        ensure  => present,
        content +> file('test\temp.txt'),
      }

      file {'C:\chrome\puppet.txt':
        ensure  => present,
        content => file('test\temp.txt'),
      }
    
      file {'C:\temp\test1.txt':
        ensure  => present,
        content => epp('test\puppet.txt.epp'),
      }

      file {'C:\Utils\test1.txt':
        ensure  => present,
        content => epp('temp\puppet.txt.epp'),
      }

      file {'C:\git\test1.txt':
        ensure  => present,
        content => epp('temp\puppet.txt.epp'),
      }

      file {'C:\chrome\test1.txt':
        ensure  => present,
        content => epp('temp\puppet.txt.epp'),
      }

    }


  }

    redhat, debian : {
      
      file {'/tmp/temp', ensure => directory,}

      file {'/tmp/utils', ensure => directory,}
    
      file {'/tmp/git', ensure => directory,}

      file {'/tmp/chrome', ensure => directory,}

      file {'/temp/file.txt':

        ensure  => present,
        content => 'hello world',
        mode    => '0755',
      }

      file {'/Utils/file.txt':

        ensure  => present,
        content => 'hello world',
        mode    => '0755',
      }
      
      file {'/git/file.txt':

        ensure  => present,
        content => 'hello world',
        mode    => '0755',
      }

      file {'/chrome/file.txt':

        ensure  => present,
        content => 'hello world',
        mode    => '0755',
      }

      file {'/temp/puppet.txt':

        ensure  => present,
        content => file('/test/temp.txt'),
        mode    => '0755',
      }

      file {'/utils/puppet.txt':

        ensure  => present,
        content => file('/test/temp.txt'),
        mode    => '0755',
      }

      file {'/git/puppet.txt':

        ensure  => present,
        content => file('/test/temp.txt'),
        mode    => '0755',
      }

      file {'/chrome/puppet.txt':

        ensure  => present,
        content => file('/test/temp.txt'),
        mode    => '0755',
      }

      file {'/temp/test1.txt':

        ensure  => present,
        content => epp('/test/puppet.txt.epp'),
        mode    => '0755',
      }

      file {'/utils/test1.txt':

        ensure  => present,
        content => epp('/test/puppet.txt.epp'),
        mode    => '0755',
      }

      file {'/git/test1.txt':

        ensure  => present,
        content => epp('/test/puppet.txt.epp'),
        mode    => '0755',
      }

      file {'/chrome/test1.txt':

        ensure  => present,
        content => epp('/test/puppet.txt.epp'),
        mode    => '0755',
      }





    }


}
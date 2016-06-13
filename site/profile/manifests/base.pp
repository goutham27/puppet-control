# class: profile::base
#
#
class profile::base {

  case $::osfamily

    'Windows': {
      class {'chocolatey':
        chocolatey_download_url         => 'https://packages.chocolatey.org/chocolatey.0.9.9.12.nupkg',
        use_7zip                        => false,
        choco_install_timeout_seconds   => 2700,
      }
    }

    'Redhat': {
       package { 'nano'
         ensure => installed,
       }

    }


}
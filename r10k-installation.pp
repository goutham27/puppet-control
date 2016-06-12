/*include r10k::mcollective

class {'r10k::webhook::config':
  enable_ssl => false,
  protected  => false,
}

class {'r10k::webhook':
  require => Class['r10k::webhook::config'],
}


# https://github.com/abrader/abrader-gms
# Add webhook to control repository ( the repo where the Puppetfile lives )
# Requires gms 0.0.6+ for disable_ssl_verify param
git_webhook { 'web_post_receive_webhook' :
  ensure             => present,
  webhook_url        => 'https://puppet:puppet@master:8088/payload',
  token              => 'xxxx',
  project_name       => 'goutham27/puppet-control',
  server_url         => 'https://api.github.com',
  disable_ssl_verify => true,
  provider           => 'github',
}
*/
class { 'r10k':
  configfile => '/etc/puppetlabs/r10k/r10k.yaml',
  sources    => {
    'puppet'    => {
      'remote'  => 'https://github.com/goutham27/puppet-control.git',
      'basedir' => "${::settings::environmentpath}",
      'prefix'  => false,
    }
  },
}
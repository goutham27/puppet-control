include r10k::mcollective

class {'r10k::webhook::config':
  enable_ssl => true,
  protected  => true,
  notify     => Service['webhook'],
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
  token              =>  hiera('github_api_token'),
  project_name       => 'goutham27/puppet-control',
  server_url         => 'https://api.github.com',
  disable_ssl_verify => true,
  provider           => 'github',
}
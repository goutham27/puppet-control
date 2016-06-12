#!/bin/bash

/usr/local/bin/puppet module install zack-r10k
/usr/local/bin/puppet module install abrader-gms
/usr/local/bin/puppet apply /vagrant/r10k-installation.pp
/usr/local/bin/r10k deploy environment -pv
/bin/echo '==> puppet config set hiera_config /etc/puppetlabs/code/environments/production/hiera.yaml'
/usr/local/bin/puppet config set hiera_config /etc/puppetlabs/code/environments/production/hiera.yaml
/bin/echo '==> /bin/systemctl restart pe-puppetserver'
/bin/systemctl restart pe-puppetserver
/bin/echo '==> /usr/local/bin/puppet agent -t'
/usr/local/bin/puppet agent -t || true
/sbin/service puppet stop
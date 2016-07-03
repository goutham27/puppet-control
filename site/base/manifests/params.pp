class base::params {
  
  case $::osfamily {
    
    'redhat' : { $ssh_name = 'sshd' }
    'debian' : { $ssh_name = 'ssh'}
    default  : { fail('OS not support by puppet module SSH')}

  }

  $author = 'amy'
}
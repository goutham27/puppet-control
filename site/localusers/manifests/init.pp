class localusers {

  user { 'admin':
    ensure     => present,
    shell      => '/bin/bash',
    home       => '/home/admin',
    gid        => 'wheel',
    managehome => true,
    password   => 'password123', 
  }

  user {'jeff' :
    ensure     => present,
    shell      => '/bin/bash',
    home       => '/home/jeff',
    groups     => ['wheel', 'finance'],
    managehome => true,
  }
	
}
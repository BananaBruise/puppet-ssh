class ssh(
  String $package_name,
  String $service_name,
  String $ensure,
  Boolean $service_enable,
  String $service_ensure,
  Boolean $permit_root_login = false,
  Integer $port              = 22,
) {
  notify {"test top scope var in a module":
    message => "test top scope ${::test_top_scope}"
  }
  class { '::ssh::install':
    #before => Class['::ssh::config'] 
  } 
  class { '::ssh::service':
    #require => Class['::ssh::install']
    #subscribe => Class['::ssh::config']
  }
  class { '::ssh::config':}

Class['::ssh::install']
->Class['::ssh::config']
~>Class['::ssh::service']
  
}

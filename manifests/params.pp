class ssh::params {  
# case statement
  case $facts['operatingsystem'] {
   /^Debian|Ubuntu/: {
     $package_name = 'openssh-server'
     $service_name = 'ssh'
     notify{ "${0} is our operating system!": }
   }
   /^RedHat|CentOS/: {
      $package_name = 'openssh-server'
      $service_name = 'sshd'
      notify{ "${0} is our operating system!": }
    }
    default : {
      fail("${facts['operatingsystem']} is not supported!")
    }
  }

  $permit_root_login = false
  $port = 22

/*
# if statement
  if $facts['os']['family'] == 'Debian' {
    $package_name = 'openssh-server'
    $service_name = 'ssh'
  }
  elsif $facts['os']['family'] == 'RedHat' {
    $package_name = 'openssh-server'
    $service_name = 'sshd'
  }
  else {
    fail("${facts['operatingsystem']} is not supperted!")
  }
# unless statement
  unless $facts['os']['family'] == 'RedHat' {
    $package_name = 'openssh-server'
    $service_name = 'ssh'    
  }
*/


}

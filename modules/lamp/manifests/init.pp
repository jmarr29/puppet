class lamp{ # execute 'yum-update update'
exec { 'yum-update':                    # exec resource named 'yum update'
  command => '/usr/bin/yum -y -q  update'  # command this resource will run
}

# install apache2 package
package { 'httpd':
  require => Exec['yum-update'],        # require 'apt-update' before installing
  ensure => installed,
}

# ensure apache2 service is running
service { 'httpd':
  require => Package['httpd'],
  ensure => running,
}

# install mysql-server package
package { 'mysql':
  require => Exec['yum-update'],        # require 'apt-update' before installing
  ensure => installed,
}
# ensure mysql service is running
service { 'mysqld':
  require => Package['mysql'],
  ensure => running,
}
 
# install php5 package
package { 'php':
  require => Exec['yum-update'],        # require 'apt-update' before installing
  ensure => installed,
}

# ensure info.php file exists
file { '/var/www/html/info.php':
  ensure => file,
  content => '<!DOCTYPE html>
<html>
<body>

<?php
echo "My first PHP script! 3";
?>

</body>
</html>',    # phpinfo code
  require => Package['httpd'],     # require 'apache2' package before creating
}
}

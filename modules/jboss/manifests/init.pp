claass jboss{
# execute 'yum update'
exec { 'yum-update':                    
  command => '/usr/bin/yum -y -q update'  
	}
}

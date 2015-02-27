file { '/etc/motd':
content => "
  General dev VM
    - OS: Ubuntu 14.04
    - IP: ${::ipaddress_eth1}
    - Netmask: ${::netmask_eth1}
    - apache
    - php
    - mysql
\n"
}
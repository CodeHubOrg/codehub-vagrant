class codehub {
    $folder = "codehub"
    $docroot = "${folder}"
    $domain = "dev.codehub.org.uk"
    $db_server = "localhost"
    $db_table = "codehub_dev"
    $db_username = "codehub_dev"
    $db_password = "password"
    $db_salt = "Gny4hXgIqkVtm2Is28XT5fcEL7UtT4JcByWVZ4VZoGyeASxD9aiDWwR4cMEyKl1v"

    file { "/var/www/${folder}" :
        ensure => directory,
        group => "vagrant",
        owner => "vagrant",
    }->
    file { "/var/www/${folder}/files" :
        ensure => directory,
        group => "vagrant",
        owner => "vagrant",
    }->
    file { "/var/www/${folder}/packages" :
        ensure => directory,
        group => "vagrant",
        owner => "vagrant",
    }->
    file { "/var/www/${folder}/config" :
        ensure => directory,
        group => "vagrant",
        owner => "vagrant",
    }->
    file { "/var/www/${folder}/config/site.php" :
        ensure => present,
        group => "vagrant",
        owner => "vagrant",
        content => "<?php
define('DB_SERVER', '${db_server}');
define('DB_USERNAME', '${db_username}');
define('DB_PASSWORD', '${db_password}');
define('DB_DATABASE', '${db_table}');
define('PASSWORD_SALT', 'Gny4hXgIqkVtm2Is28XT5fcEL7UtT4JcByWVZ4VZoGyeASxD9aiDWwR4cMEyKl1v');
"
    }

    apache::vhost { "${domain}":
        port => '80',
        docroot => "/var/www/${docroot}",
        template => "/vagrant/manifests/nodes/templates/vhosts/vhost.erb"
    }

    mysql::db { $db_table:
        user => $db_username,
        password => $db_password,
        host => $db_server
    }
}

class { 'codehub': }

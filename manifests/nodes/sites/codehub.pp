class codehub {
    $folder = "codehub"
    $docroot = "${folder}/_site"
    $domain = "dev.codehub.org.uk"

    file { "/var/www/${folder}" :
        ensure => directory,
        group => "vagrant",
        owner => "vagrant",
        recurse => false,
    }

    apache::vhost { "${domain}":
        port    => '80',
        docroot => "/var/www/${docroot}",
        template => "/vagrant/manifests/nodes/templates/vhosts/vhost.erb"
    }
}

class { 'codehub': }

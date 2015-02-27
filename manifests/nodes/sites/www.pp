class www_folder {
    $folder = ""
    $docroot = $folder
    $domain = "vagrant.dev.com"

    file { "/var/www" :
        ensure => directory,
        group => "vagrant",
        owner => "vagrant",
        recurse => false,
    }

    apache::vhost { "${domain}":
        port    => '80',
        docroot => '/var/www',
        template => "/vagrant/manifests/nodes/templates/vhosts/vhost.erb"
    }
}

class { 'www_folder': }
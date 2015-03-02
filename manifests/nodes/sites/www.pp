file { "/var/www" :
    ensure => directory,
    group => "vagrant",
    owner => "vagrant",
    recurse => false,
}
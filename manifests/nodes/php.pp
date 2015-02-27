$packages = [
    "php5",
    "php5-cli",
    "php5-mysql",
    "php-pear",
    "php5-dev",
    "php-apc",
    "php5-mcrypt",
    "php5-gd",
    "php5-curl",
    "libapache2-mod-php5",
    "php5-xdebug",
    "php5-memcache",
    "php5-memcached",
    "php5-pgsql",
    "php5-sqlite",
    "php5-imagick"
]

package
{
    $packages:
        ensure  => latest,
}

file { "/etc/php5/apache2/php.ini":
    ensure => present,
    group => root,
    owner => root,
    notify => Service['apache2'],
    source => '/vagrant/manifests/nodes/templates/php/php.ini',
    require => [Package['php5'], Package['apache2']],
}

file { "/etc/php5/cli/php.ini":
    ensure => present,
    group => root,
    owner => root,
    notify => Service['apache2'],
    source => '/vagrant/manifests/nodes/templates/php/cli.php.ini',
    require => [Package['php5']],
}
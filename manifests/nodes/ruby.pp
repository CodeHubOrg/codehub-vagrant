class { 'ruby':
    gems_version => 'latest'
}

package { 'jekyll':
    ensure => 'installed',
    provider => 'gem',
    require => Class['ruby']
}

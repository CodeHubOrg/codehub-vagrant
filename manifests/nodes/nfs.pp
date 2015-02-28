# enable nfs sharing
package { 'nfs-kernel-server':
    ensure => installed
}

service { 'nfs-kernel-server':
    ensure => running,
    enable => true,
    hasstatus => true,
    hasrestart => true
}
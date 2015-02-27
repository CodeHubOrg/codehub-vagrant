/*
    The first stage is used to make sure the necessary
    PPA's and packages are present to ensure latest versions
    of the packages we require in the main stage
*/
class first_stage {
    apt::ppa { 'ppa:git-core/ppa':}

    # TODO: change PPA
    # https://nodesource.com/blog/chris-lea-joins-forces-with-nodesource
    # https://deb.nodesource.com/setup
    apt::ppa { 'ppa:chris-lea/node.js':}

    apt::ppa { 'ppa:ondrej/php5 -y':
        require => Package['software-properties-common']
    }

    apt::ppa{'ppa:brightbox/ruby-ng-experimental':}
}

/*
    Using stages to make sure apt is up to date before
    we start installing packages in the main stage
*/
if ($stages == "yes") {
    stage { 'first': }

    Stage['first'] -> Stage['main']

    class { 'first_stage':
        stage => first
    }

    class { '::apt':
        always_apt_update => true,
        stage => first
    }
} else {
    class { '::apt':
        always_apt_update => false
    }
}
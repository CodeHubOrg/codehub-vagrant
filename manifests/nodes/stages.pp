/*
    The first stage is used to make sure the necessary
    PPA's and packages are present to ensure latest versions
    of the packages we require in the main stage
*/
class first_stage {
    package { "software-properties-common":}
    ->
    apt::ppa { 'ppa:ondrej/php5 -y':}
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
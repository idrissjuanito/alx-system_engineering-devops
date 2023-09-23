# install a specific version of flask
node 'default'{
    package {'flask==2.1.0':
        ensure   => installed,
        provider => pip3,
    }
}

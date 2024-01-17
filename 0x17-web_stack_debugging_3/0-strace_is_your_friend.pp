# manifest renames a faulty wordpress file to the naming required at runtime
node default {
    file { 'rename wp-class-locale file':
        ensure => present,
        path   => '/var/www/html/wp-includes/class-wp-locale.phpp',
        owner  => www-data,
        group  => www-data,
        mode   => '0644',
        source => '/var/www/html/wp-includes/class-wp-locale.php'
    }
}

class motd::puppetmaster {
    include motd

    package{'figlet':
        ensure => present,
    }
    file{"/usr/local/sbin/motd_gen.sh":
        source => "puppet://$server/modules/motd/motd_gen.sh",
        require => Package['figlet'],
        before => File['/etc/motd'],
        owner => puppet, group => 0, mode => 0755;
    }
}

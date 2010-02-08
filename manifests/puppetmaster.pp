class motd::puppetmaster {
    package{'figlet':
        ensure => present,
        before => File['/etc/motd'],
    }
    file{"/usr/local/sbin/motd_gen.sh":
        source => "puppet://$server/motd/motd_gen.sh",
        before => File['/etc/motd'],
        require => Package['figlet'], 
        owner => puppet, group => 0, mode => 0755;
    }
}

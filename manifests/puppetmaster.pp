class motd::puppetmaster {
  package{'figlet':
    ensure => present,
  }
  file{"/usr/local/sbin/motd_gen.sh":
    source => "puppet://$server/modules/motd/motd_gen.sh",
    require => Package['figlet'],
    owner => puppet, group => 0, mode => 0755;
  }
}

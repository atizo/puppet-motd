#######################################
# motd module
# Puzzle ITC - haerry+puppet(at)puzzle.ch
# GPLv3
# include motd::puppetmaster on the 
# master before you to any motd::client
# calls. 
# content and generate functions
# are evaluated on the master!
# you can pass additional messages by
# setting $motd_message to some string
#######################################


# modules_dir { "motd": }
class motd { }

class motd::client {
    file{"/etc/motd":
        content => generate("/opt/bin/motd_gen.sh", "${hostname}", "${motd_message}"),
        owner => root, group => 0, mode => 0644;
    } 
}

class motd::puppetmaster {
    package{figlet:
        ensure => installed,
        before => File["/etc/motd"],
    }

    file{"/opt/bin/motd_gen.sh":
        source => "puppet://$server/motd/motd_gen.sh"
        require => [ Package[figlet], File["/opt/bin"] ],
        owner => root, group => 0; mode => 0744;
    }
}

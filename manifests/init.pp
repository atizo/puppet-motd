#
# motd module
#
# Copyright 2008, Puzzle ITC GmbH
# Copyright 2010, Atizo AG
# Marcel Härry haerry+puppet(at)puzzle.ch
# Simon Josi simon.josi+puppet(at)atizo.com
#
# This program is free software; you can redistribute 
# it and/or modify it under the terms of the GNU 
# General Public License version 3 as published by 
# the Free Software Foundation.
#
# include motd::puppetmaster on the master 
# before you do any motd::client calls. 
# content and generate functions
# are evaluated on the master!
# you can pass additional messages by
# setting $motd_message to some string

class motd {
  file{'/etc/motd':
    content => generate('/usr/local/sbin/motd_gen.sh', $hostname, $motd_message),
    owner => root, group => 0, mode => 0644;
   }
}

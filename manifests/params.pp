# @summary Parameters
# @api private
class rkhunter::params {
  $tmpdir              = $facts['os']['family'] ? {
    'RedHat' => '/var/lib/rkhunter',
    default  => '/var/lib/rkhunter/tmp',
  }
  $logfile             = $facts['os']['family'] ? {
    'RedHat' => '/var/log/rkhunter/rkhunter.log',
    default  => '/var/log/rkhunter.log',
  }
  $append_log          = $facts['os']['family'] ? {
    'RedHat' => true,
    default  => false,
  }
  $use_syslog          = $facts['os']['family'] ? {
    'RedHat' => 'authpriv.notice',
    default  => undef,
  }
  $auto_x_detect       = $facts['os']['family'] ? {
    'RedHat' => true,
    default  => false,
  }
  $allow_ssh_root_user = $facts['os']['family'] ? {
    'RedHat' => 'unset',
    default  => 'no',
  }
  $disable_unhide      = $facts['os']['family'] ? {
    'RedHat' => undef,
    default  => '1',
  }
  $package_manager     = $facts['os']['family'] ? {
    'RedHat' => 'RPM',
    default  => undef,  #"NONE"
  }
  $existwhitelist      = $facts['os']['family'] ? {
    'RedHat' => [
      '/var/log/pki-ca/system',
      '/var/log/pki/pki-tomcat/ca/system', # FreeIPA Certificate Authority
      '/usr/bin/GET',
      '/usr/bin/whatis',
    ],
    default  => [],             #['/path/one /path/bar', '/path/foobar*']
  }
  $rtkt_file_whitelist = $facts['os']['family'] ? {
    'RedHat' => [
      '/var/log/pki-ca/system',            # FreeIPA Certificate Authority
      '/var/log/pki/pki-tomcat/ca/system',
    ],
    default  => [],
  }

  case $facts['os']['family'] {
    'RedHat': {
      $scriptwhitelist = [
        '/usr/bin/whatis',
        '/usr/bin/ldd',
        '/usr/bin/groups',
        '/usr/bin/GET',
      ]
    }
    default: {
      $scriptwhitelist = [
        '/bin/egrep',
        '/bin/fgrep',
        '/bin/which',
        '/usr/bin/groups',
        '/usr/bin/ldd',
        '/usr/bin/lwp-request',
        '/usr/sbin/adduser',
        '/usr/sbin/prelink',
      ]
    }
  }
  $allowhiddendir = $facts['os']['family'] ? {
    'RedHat' => [
      '/etc/.java',
      '/dev/.udev',
      '/dev/.udevdb',
      '/dev/.udev.tdb',
      '/dev/.udev/db',
      '/dev/.udev/rules.d',
      '/dev/.static',
      '/dev/.initramfs',
      '/dev/.SRC-unix',
      '/dev/.mdadm',
      '/dev/.systemd',
      '/dev/.mount',
      '/etc/.git',
      '/etc/.bzr',
    ],
    'Debian' => [
      '/etc/.java',
      '/dev/.udev',
      '/dev/.initramfs',
    ],
    default  => [
#      '/etc/.java',
#      '/dev/.static',
#      '/dev/.SRC-unix',
#      '/etc/.etckeeper',
    ],
  }
  $allowhiddenfile = $facts['os']['family'] ? {
    'RedHat' => [
      '/usr/share/man/man1/..1.gz',
      '/lib*/.libcrypto.so.*.hmac',
      '/lib*/.libssl.so.*.hmac',
      '/usr/bin/.fipscheck.hmac',
      '/usr/bin/.ssh.hmac',
      '/usr/bin/.ssh-keygen.hmac',
      '/usr/bin/.ssh-keyscan.hmac',
      '/usr/bin/.ssh-add.hmac',
      '/usr/bin/.ssh-agent.hmac',
      '/usr/lib*/.libfipscheck.so.*.hmac',
      '/usr/lib*/.libgcrypt.so.*.hmac',
      '/usr/lib*/hmaccalc/sha1hmac.hmac',
      '/usr/lib*/hmaccalc/sha256hmac.hmac',
      '/usr/lib*/hmaccalc/sha384hmac.hmac',
      '/usr/lib*/hmaccalc/sha512hmac.hmac',
      '/usr/sbin/.sshd.hmac',
      '/dev/.mdadm.map',
      '/dev/.udev/queue.bin',
      '/usr/share/man/man5/.k5login.5.gz',
      '/usr/share/man/man5/.k5identity.5.gz',
      '/usr/sbin/.ipsec.hmac',
      '/sbin/.cryptsetup.hmac',
      # etckeeper
      '/etc/.etckeeper',
      '/etc/.gitignore',
      '/etc/.bzrignore',
# systemd
      '/etc/.updated',
    ],
    default  => [
#      '/etc/.java',
#      '/usr/share/man/man1/..1.gz',
#      '/etc/.pwd.lock',
#      '/etc/.init.state',
#      '/lib/.libcrypto.so.0.9.8e.hmac /lib/.libcrypto.so.6.hmac',
#      '/lib/.libssl.so.0.9.8e.hmac /lib/.libssl.so.6.hmac',
#      '/usr/bin/.fipscheck.hmac',
#      '/usr/bin/.ssh.hmac',
#      '/usr/lib/.libfipscheck.so.1.1.0.hmac',
#      '/usr/lib/.libfipscheck.so.1.hmac',
#      '/usr/lib/.libgcrypt.so.11.hmac',
#      '/usr/lib/hmaccalc/sha1hmac.hmac',
#      '/usr/lib/hmaccalc/sha256hmac.hmac',
#      '/usr/lib/hmaccalc/sha384hmac.hmac',
#      '/usr/lib/hmaccalc/sha512hmac.hmac',
#      '/usr/sbin/.sshd.hmac',
#      '/usr/share/man/man5/.k5login.5.gz',
#      '/etc/.gitignore',
#      '/etc/.bzrignore',
    ],
  }
  $allowdevfile = $facts['os']['family'] ? {
    'RedHat' => [
      '/dev/shm/pulse-shm-*',
      '/dev/md/md-device-map',
      '/dev/shm/mono.*', # tomboy creates this one
      '/dev/shm/libv4l-*', # created by libv4l
      '/dev/shm/spice.*', # created by spice video
      '/dev/md/autorebuild.pid', # created by mdadm
      '/dev/shm/sem.slapd-*.stats', # 389 Directory Server
      '/dev/shm/squid-cf*', # squid proxy
      '/dev/shm/squid-ssl_session_cache.shm', # squid ssl cache
      '/dev/.mdadm.map',
      '/dev/.udev/queue.bin',
      '/dev/.udev/db/*',
      '/dev/.udev/rules.d/99-root.rules',
      '/dev/.udev/uevent_seqnum',
      # Allow PCS/Pacemaker/Corosync
      '/dev/shm/qb-attrd-*',
      '/dev/shm/qb-cfg-*',
      '/dev/shm/qb-cib_rw-*',
      '/dev/shm/qb-cib_shm-*',
      '/dev/shm/qb-corosync-*',
      '/dev/shm/qb-cpg-*',
      '/dev/shm/qb-lrmd-*',
      '/dev/shm/qb-pengine-*',
      '/dev/shm/qb-quorum-*',
      '/dev/shm/qb-stonith-*',
    ],
    default  => [
#      '/dev/shm/pulse-shm-*',
#      '/dev/shm/sem.ADBE_*',
    ],
  }
}

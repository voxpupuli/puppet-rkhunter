#
# @summary install the rkhunter package and initialize it
#
# @api private
#
# @param package_name name of the rkhunter package that will be installed
#
class rkhunter::packages (
  $package_name = $rkhunter::package_name,
  $install_options = $rkhunter::package_install_options,
) {
  assert_private()

  package { 'rkhunter':
    ensure          => installed,
    name            => $package_name,
    install_options => $install_options,
  }

  file { '/usr/local/bin/rktask':
    ensure => file,
    mode   => '0755',
    source => 'puppet:///modules/rkhunter/rktask',
  }

  # Run rkhunter --propupd after installation of package
  exec { '/usr/bin/rkhunter --propupd':
    path    => ['/usr/local/sbin/', '/usr/local/bin/', '/usr/sbin', '/usr/bin', '/bin', '/sbin'],
    unless  => '/usr/bin/test -f /var/lib/rkhunter/db/rkhunter_prop_list.dat && /usr/bin/test -f /var/lib/rkhunter/db/rkhunter.dat',
    require => [
      Package['rkhunter'],
      File['/etc/rkhunter.conf'],
    ],
  }
}

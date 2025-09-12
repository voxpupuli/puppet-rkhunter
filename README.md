# puppet-rkhunter

[![Build Status](https://travis-ci.org/voxpupuli/puppet-rkhunter.png?branch=master)](https://travis-ci.org/voxpupuli/puppet-rkhunter)
[![Puppet Forge](https://img.shields.io/puppetforge/v/puppet/rkhunter.svg)](https://forge.puppetlabs.com/puppet/rkhunter)
[![Puppet Forge - downloads](https://img.shields.io/puppetforge/dt/puppet/rkhunter.svg)](https://forge.puppetlabs.com/puppet/rkhunter)
[![Puppet Forge - endorsement](https://img.shields.io/puppetforge/e/puppet/rkhunter.svg)](https://forge.puppetlabs.com/puppet/rkhunter)
[![Puppet Forge - scores](https://img.shields.io/puppetforge/f/puppet/rkhunter.svg)](https://forge.puppetlabs.com/puppet/rkhunter)

Manage rkhunter installation and configuration with Puppet.

## Features

- Manage ALL config entries (some of them dont make sense in server environments)
- Manage your whitelists
- The check cronjob is called staggered (predefined timewindow)
- The db update cronjob is configured separately

## Supported OS

See [`metadata.json`](metadata.json) for the list of supported operating systems.

## Used Modules

Other than some data types from [puppetlabs/stdlib](https://forge.puppet.com/puppetlabs/stdlib),
no other external modules are used.

## Configuration

See `templates/etc/rkhunter.conf.erb` for detailed explanation of the rkhunter
config options. Important: full possible configuration is visible in params.pp.
Do not uncomment them in params.pp.

### Minimal configuration

```puppet
  include rkhunter
  include rkhunter::cron
```

### A bit bigger configuration

```puppet
class { 'rkhunter':
  allow_ssh_root_user         => 'yes',
  shared_lib_whitelist        => [ '/lib/snoopy.so' ],
  allow_syslog_remote_logging => "1",
  scriptwhitelist             => [
    '/bin/egrep',
    '/bin/fgrep',
    '/bin/which',
    '/usr/bin/groups',
    '/usr/bin/ldd',
    '/usr/bin/lwp-request',
    '/usr/sbin/adduser',
  ],
}
include rkhunter::cron
```

### List of optional configuration parameters

NOTE: there may be more. I do not update this list every time. Have a look into params.pp

```
  rotate_mirrors
  update_mirrors
  mirrors_mode
  mail_on_warning
  tmpdir
  dbdir
  scriptdir
  logfile
  append_log
  copy_log_on_error
  use_syslog
  color_set2
  auto_x_detect
  whitelisted_is_white
  allow_ssh_root_user
  allow_ssh_prot_v1
  enable_tests
  disable_tests
  immutable_set
  allow_syslog_remote_logging
  suspscan_temp
  suspscan_maxsize
  suspscan_thresh
  use_locking
  lock_timeout
  show_lockmsgs
  disable_unhide
  installdir
  ssh_config_dir
  hash_func
  hash_fld_idx
  package_manager
  pkgmgr_no_verfy
  ignore_prelink_dep_err
  use_sunsum
  existwhitelist
  attrwhitelist
  writewhitelist
  scan_mode_dev
  phlanx2_dirtest
  inetd_conf_path
  inetd_allowed_svc
  xinetd_conf_path
  xinetd_allowed_svc
  startup_paths
  passwd_file
  user_fileprop_files_dirs
  rtkt_file_whitelist
  rtkt_dir_whitelist
  scriptwhitelist
  immutewhitelist
  allowhiddendir
  allowhiddenfile
  allowprocdelfile
  allowproclisten
  allowpromiscif
  allowdevfile
  allowipcproc
  uid0_accounts
  pwdless_accounts
  syslog_config_file
  app_whitelist
  suspscan_dirs
  port_whitelist
  shared_lib_whitelist
```

## License

This project is licensed under the Apache-2 license

## Copyright and origin

This repository was forked from https://github.com/mmz-srf/puppet-rkhunter and is now maintained
by the Vox Pupuli community.

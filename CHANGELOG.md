# Changelog

All notable changes to this project will be documented in this file.
Each new release typically also includes the latest modulesync defaults.
These should not affect the functionality of the module.

## [v4.0.0](https://github.com/voxpupuli/puppet-rkhunter/tree/v4.0.0) (2025-09-13)

[Full Changelog](https://github.com/voxpupuli/puppet-rkhunter/compare/v3.0.0...v4.0.0)

**Breaking changes:**

- Drop support for EOL Debian 10 [\#48](https://github.com/voxpupuli/puppet-rkhunter/pull/48) ([kenyon](https://github.com/kenyon))
- Drop puppet, update openvox minimum version to 8.19 [\#43](https://github.com/voxpupuli/puppet-rkhunter/pull/43) ([TheMeier](https://github.com/TheMeier))

**Implemented enhancements:**

- Add support for Debian 13 [\#51](https://github.com/voxpupuli/puppet-rkhunter/pull/51) ([kenyon](https://github.com/kenyon))
- Add support for Enterprise Linuxes \(CentOS 9, Alma 8-9, Rocky 8-9, Oracle 8-9\) [\#50](https://github.com/voxpupuli/puppet-rkhunter/pull/50) ([kenyon](https://github.com/kenyon))
- Add Debian 12 support [\#39](https://github.com/voxpupuli/puppet-rkhunter/pull/39) ([bastelfreak](https://github.com/bastelfreak))
- metadata.json: Add OpenVox [\#36](https://github.com/voxpupuli/puppet-rkhunter/pull/36) ([jstraw](https://github.com/jstraw))
- Add support for package `install_options` [\#29](https://github.com/voxpupuli/puppet-rkhunter/pull/29) ([yorickps](https://github.com/yorickps))

**Merged pull requests:**

- Add some minimal reference doc strings [\#52](https://github.com/voxpupuli/puppet-rkhunter/pull/52) ([kenyon](https://github.com/kenyon))
- README: replace section on supported operating systems with a link to `metadata.json` [\#49](https://github.com/voxpupuli/puppet-rkhunter/pull/49) ([kenyon](https://github.com/kenyon))
- Generate REFERENCE.md [\#45](https://github.com/voxpupuli/puppet-rkhunter/pull/45) ([kenyon](https://github.com/kenyon))

## [v3.0.0](https://github.com/voxpupuli/puppet-rkhunter/tree/v3.0.0) (2024-02-03)

[Full Changelog](https://github.com/voxpupuli/puppet-rkhunter/compare/v2.2.0...v3.0.0)

**Breaking changes:**

- Drop Debian 9 [\#26](https://github.com/voxpupuli/puppet-rkhunter/pull/26) ([zilchms](https://github.com/zilchms))
- Drop Puppet 6 support [\#23](https://github.com/voxpupuli/puppet-rkhunter/pull/23) ([bastelfreak](https://github.com/bastelfreak))
- Metadata updates; Drop Debian 7 support; Drop CentOS 5/6 support [\#17](https://github.com/voxpupuli/puppet-rkhunter/pull/17) ([kenyon](https://github.com/kenyon))

**Implemented enhancements:**

- Add Puppet 8 support [\#25](https://github.com/voxpupuli/puppet-rkhunter/pull/25) ([bastelfreak](https://github.com/bastelfreak))
- puppetlabs/stdlib: Allow 9.x [\#24](https://github.com/voxpupuli/puppet-rkhunter/pull/24) ([bastelfreak](https://github.com/bastelfreak))
- Type improvements: allow Boolean and Integer in addition to String where applicable [\#16](https://github.com/voxpupuli/puppet-rkhunter/pull/16) ([kenyon](https://github.com/kenyon))

**Merged pull requests:**

- Allow stdlib 8.0.0 [\#18](https://github.com/voxpupuli/puppet-rkhunter/pull/18) ([smortex](https://github.com/smortex))

## [v2.2.0](https://github.com/voxpupuli/puppet-rkhunter/tree/v2.2.0) (2020-08-23)

[Full Changelog](https://github.com/voxpupuli/puppet-rkhunter/compare/v2.1.0...v2.2.0)

**Implemented enhancements:**

- Add CentOS 8 support [\#12](https://github.com/voxpupuli/puppet-rkhunter/pull/12) ([bastelfreak](https://github.com/bastelfreak))

**Merged pull requests:**

- modulesync 3.0.0 & puppet-lint updates [\#11](https://github.com/voxpupuli/puppet-rkhunter/pull/11) ([bastelfreak](https://github.com/bastelfreak))

## [v2.1.0](https://github.com/voxpupuli/puppet-rkhunter/tree/v2.1.0) (2020-04-29)

[Full Changelog](https://github.com/voxpupuli/puppet-rkhunter/compare/v2.0.0...v2.1.0)

**Implemented enhancements:**

- Add `language` and `update_lang` parameters [\#9](https://github.com/voxpupuli/puppet-rkhunter/pull/9) ([alexjfisher](https://github.com/alexjfisher))

## [v2.0.0](https://github.com/voxpupuli/puppet-rkhunter/tree/v2.0.0) (2019-12-21)

[Full Changelog](https://github.com/voxpupuli/puppet-rkhunter/compare/v1.0.1...v2.0.0)

**Breaking changes:**

- Modulesync 2.9.0 / Make `disable_unhide` `Optional`, convert params to boolean and small fixes [\#5](https://github.com/voxpupuli/puppet-rkhunter/pull/5) ([bastelfreak](https://github.com/bastelfreak))

**Implemented enhancements:**

- Add support for different IPC options [\#3](https://github.com/voxpupuli/puppet-rkhunter/pull/3) ([bastelfreak](https://github.com/bastelfreak))

**Fixed bugs:**

- remove ß from template [\#2](https://github.com/voxpupuli/puppet-rkhunter/pull/2) ([bastelfreak](https://github.com/bastelfreak))

**Merged pull requests:**

- Replace LICENSE with version from apache.org [\#4](https://github.com/voxpupuli/puppet-rkhunter/pull/4) ([bastelfreak](https://github.com/bastelfreak))
- Add `dependencies` to metadata.json [\#1](https://github.com/voxpupuli/puppet-rkhunter/pull/1) ([bastelfreak](https://github.com/bastelfreak))


## [v1.0.1](https://github.com/voxpupuli/puppet-rkhunter/tree/v1.0.1) (2017-05-29)

* Regression fix. re-add hidden files to allowdevfiles

## 1.0.0 - 2017-03-29

* Sync rkhunter.conf template with default file from version 1.4.2.
* Add and update parameters accordingly
* Remove travis tests for Puppet 3 and Ruby < 2.3.
* Module should still work with older versions, but test tools are not compatible

### added parameters

* `mail_cmd`
* `bindir`
* `unhidetcp_opts`
* `port_path_whitelist`
* `warn_on_os_change`
* `updt_on_os_change`
* `show_summary_warnings_number`
* `show_summary_time`
* `empty_logfiles`
* `missing_logfiles`

### renamed parameters

* `hash_func` to `hash_cmd` (renamed upstream)
* `phlanx2_dirtest` to `phalanx2_dirtest` (fix typo)

## 0.2.0 - 2016-02-19

### Fixed

* ERB deprecation warnings (Puppet 4 support)

### Changed

* Updated the metadata to the new format
* Some new defaults for RedHat and Debian
* Added specific OS versions to the metadata

### Removed

* FreeBSD support

## 0.1.4 - 2013-12-09

### Changed

* Better RedHat/Centos suport
* Change cron command to use fqdn\_rand function.
* Added CHANGELOG


\* *This Changelog was automatically generated by [github_changelog_generator](https://github.com/github-changelog-generator/github-changelog-generator)*

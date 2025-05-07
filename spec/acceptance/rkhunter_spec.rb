require 'spec_helper_acceptance'

describe 'rkhunter class' do
  context 'default parameters' do
    # Using puppet_apply as a helper
    it 'works idempotently with no errors' do
      pp = <<-EOS
      include rkhunter
      include rkhunter::cron
      include rkhunter::cron_updatedb
      EOS

      # Run it twice and test for idempotency
      apply_manifest(pp, catch_failures: true)
      apply_manifest(pp, catch_changes: true)
    end

    # do some basic checks
    describe package('rkhunter') do
      it { is_expected.to be_installed }
    end
  end

  # unhide isn't available in CentOS 8
  context 'with custom parameters', if: fact('os.release.major').to_i < 8 do
    it 'works idempotently with no errors' do
      pp = <<-EOS
      package { 'unhide':
        ensure => installed,
        before => Class['rkhunter::packages'],
      }
      class{'rkhunter':
        pkgmgr_no_verfy     => ['/bin/ls'],
        allowproclisten     => ['/usr/sbin/tcpdump'],
        port_path_whitelist => ['/usr/sbin/squid'],
        rtkt_file_whitelist => ['/etc/rc.local:hdparm'],
        ipc_seg_size        => 1048576,
        local_mirror        => 'http://localhost/mirror',
        update_mirrors      => true,
        mirrors_mode        => 'any',
        allowdevfile        => ['/dev/shm/sem.ADBE_*'],
        xinetd_allowed_svc  => ['/etc/xinetd.d/echo'],
      }
      EOS

      # Run it twice and test for idempotency
      apply_manifest(pp, catch_failures: true)
      apply_manifest(pp, catch_changes: true)
    end

    # do some basic checks
    describe package('rkhunter') do
      it { is_expected.to be_installed }
    end
  end
end

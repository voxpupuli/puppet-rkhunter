require 'spec_helper'

describe 'rkhunter', type: :class do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) { facts }

      it { is_expected.to contain_class('rkhunter::packages') }
      it { is_expected.to contain_class('rkhunter::params') }

      it do
        is_expected.to contain_file('/etc/rkhunter.conf').with(
          'owner' => 'root',
          'group' => 'root',
          'mode' => '0644',
        )
      end

      it { is_expected.to contain_file('/usr/local/bin/rktask') }
      it { is_expected.to contain_file('/var/lib/rkhunter/db/mirrors.dat') }
      it { is_expected.to contain_package('rkhunter').with('ensure' => 'installed') }
      it { is_expected.to contain_exec('/usr/bin/rkhunter --propupd') }
      it { is_expected.to contain_file_line('Remove local mirror from mirrors.dat') }

      describe 'variant data type variables' do
        context 'by default' do
          it { is_expected.to contain_file('/etc/rkhunter.conf').with_content(%r{^ALLOW_SSH_PROT_V1=0}) }
          it { is_expected.to contain_file('/etc/rkhunter.conf').with_content(%r{^IMMUTABLE_SET=0}) }
          it { is_expected.to contain_file('/etc/rkhunter.conf').with_content(%r{^SUSPSCAN_MAXSIZE=10240000}) }
          it { is_expected.to contain_file('/etc/rkhunter.conf').with_content(%r{^SUSPSCAN_THRESH=200}) }
          it { is_expected.to contain_file('/etc/rkhunter.conf').with_content(%r{^LOCK_TIMEOUT=300}) }

          if facts[:os]['family'] == 'RedHat'
            it { is_expected.to contain_file('/etc/rkhunter.conf').without_content(%r{^DISABLE_UNHIDE}) }
          else
            it { is_expected.to contain_file('/etc/rkhunter.conf').with_content(%r{^DISABLE_UNHIDE=1}) }
          end
        end

        context 'when set with a string' do
          let(:params) do
            {
              allow_ssh_prot_v1: '2',
              immutable_set: '1',
              suspscan_maxsize: '123',
              suspscan_thresh: '234',
              lock_timeout: '345',
              disable_unhide: '1',
            }
          end

          it { is_expected.to contain_file('/etc/rkhunter.conf').with_content(%r{^ALLOW_SSH_PROT_V1=2}) }
          it { is_expected.to contain_file('/etc/rkhunter.conf').with_content(%r{^IMMUTABLE_SET=1}) }
          it { is_expected.to contain_file('/etc/rkhunter.conf').with_content(%r{^SUSPSCAN_MAXSIZE=123}) }
          it { is_expected.to contain_file('/etc/rkhunter.conf').with_content(%r{^SUSPSCAN_THRESH=234}) }
          it { is_expected.to contain_file('/etc/rkhunter.conf').with_content(%r{^LOCK_TIMEOUT=345}) }
          it { is_expected.to contain_file('/etc/rkhunter.conf').with_content(%r{^DISABLE_UNHIDE=1}) }
        end

        context 'when set with an integer' do
          let(:params) do
            {
              allow_ssh_prot_v1: 2,
              immutable_set: 1,
              suspscan_maxsize: 123,
              suspscan_thresh: 234,
              lock_timeout: 345,
              disable_unhide: 2,
            }
          end

          it { is_expected.to contain_file('/etc/rkhunter.conf').with_content(%r{^ALLOW_SSH_PROT_V1=2}) }
          it { is_expected.to contain_file('/etc/rkhunter.conf').with_content(%r{^IMMUTABLE_SET=1}) }
          it { is_expected.to contain_file('/etc/rkhunter.conf').with_content(%r{^SUSPSCAN_MAXSIZE=123}) }
          it { is_expected.to contain_file('/etc/rkhunter.conf').with_content(%r{^SUSPSCAN_THRESH=234}) }
          it { is_expected.to contain_file('/etc/rkhunter.conf').with_content(%r{^LOCK_TIMEOUT=345}) }
          it { is_expected.to contain_file('/etc/rkhunter.conf').with_content(%r{^DISABLE_UNHIDE=2}) }
        end

        context 'when set with a Boolean' do
          let(:params) do
            {
              immutable_set: true,
            }
          end

          it { is_expected.to contain_file('/etc/rkhunter.conf').with_content(%r{^IMMUTABLE_SET=1}) }
        end
      end

      describe 'language' do
        context 'by default' do
          it do
            is_expected.to contain_file('/etc/rkhunter.conf').without_content(%r{^LANGUAGE})
          end
        end

        context 'when set' do
          let(:params) { { language: 'de' } }

          it do
            is_expected.to contain_file('/etc/rkhunter.conf').with_content(%r{^LANGUAGE=de$})
          end
        end
      end

      describe 'update_lang' do
        context 'by default' do
          it do
            is_expected.to contain_file('/etc/rkhunter.conf').without_content(%r{^UPDATE_LANG=})
          end
        end

        context 'when set' do
          let(:params) { { update_lang: %w[en de] } }

          it do
            is_expected.to contain_file('/etc/rkhunter.conf').with_content(%r{^UPDATE_LANG="en de"$})
          end
        end
      end
    end
  end
end

# frozen_string_literal: true

control 'hostsfile configuration' do
  title 'should match desired lines'

  describe file('/etc/hosts') do
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
  end
end

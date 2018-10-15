# Test for Ansible docker container

java_package = 'java-1.8.0-openjdk' if os.family == 'redhat'
java_package = 'openjdk-8-jdk' if os.family == 'debian'

control 'jenkins-slave-01' do
  impact 1.0
  title 'Java install'
  desc 'Java 8 should be installed'
  describe package(java_package) do
    it { should be_installed }
  end
end

control 'jenkins-slave-02' do
  impact 1.0
  title 'Jenkins jar'
  desc 'Jenkins jar should be present'
  describe file('/usr/share/jenkins/slave.jar') do
    it { should exist }
    its('mode') { should cmp '0644' }
  end
end

control 'jenkins-slave-03' do
  impact 1.0
  title 'Jenkins slave'
  desc 'Jenkins slave binary should be present'
  describe file('/usr/local/bin/jenkins-slave') do
    it { should exist }
    it { should be_executable }
  end
end

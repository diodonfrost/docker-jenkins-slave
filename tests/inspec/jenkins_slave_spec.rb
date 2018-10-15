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

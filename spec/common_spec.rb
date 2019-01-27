# # encoding: utf-8

# Inspec test for recipe install-py-rb-go::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

# Check command
RSpec.shared_context 'check_command' do
	its('stderr') { should eq '' }
	its('exit_status') { should eq 0 }
end

# check asdf directory
ghq_repos = ["Yusuke-Shimizu/ansible-role-setup-mac", "Yusuke-Shimizu/prometheus-test", "Yusuke-Shimizu/ansible_role_VirtualBox_Extension-Pack", "Yusuke-Shimizu/ansible_role_asdf_on_mac", "Yusuke-Shimizu/install-rb-py-go-on-asdf", "Yusuke-Shimizu/travisci-test", "Yusuke-Shimizu/install-py-rb-go-cookbook", "Yusuke-Shimizu/osx-circleci-chef", "Yusuke-Shimizu/circleci-test", "asdf-vm/asdf", "geerlingguy/mac-dev-playbook", "geerlingguy/ansible-role-homebrew", "geerlingguy/dotfiles", "geerlingguy/ansible-role-mas", "cimon-io/ansible-role-asdf", "CircleCI-Public/circleci-demo-ios"]
describe command("ghq list") do
	include_context 'check_command'
	ghq_repos.each{|repo_name|
		its('stdout') { should include "#{repo_name}" }
	}
end

describe package('fish') do
	it { should be_installed }
end

fisher_plugins = ["0rax/fish-bd", "jethrokuan/z", "jorgebucaran/fishtape", "oh-my-fish/plugin-peco", "yoshiori/fish-peco_select_ghq_repository"]
describe command("fish -lc 'fisher ls'") do
	include_context 'check_command'
	fisher_plugins.each{|fisher_plugin_name|
		its('stdout') { should include "#{fisher_plugin_name}" }
	}
end

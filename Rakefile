require 'rake'

namespace :inspec do
  desc "Run Inspec tests"
  task :default do
    sh 'inspec exec spec/common_spec.rb'
  end
end

namespace :ansible do
  desc "syntax check"
  task :syntax do
    sh 'ansible-playbook main.yml --syntax-check'
  end

  desc "build check"
  task :check do
    sh 'ansible-playbook main.yml -i inventory -vv --check'
  end

  desc "build"
  task :build do
    sh 'ansible-playbook main.yml -i inventory -vv'
  end

  desc "install requirements from galaxy"
  task :install do
    sh 'ansible-galaxy install -r requirements.yml'
  end
end

namespace :ci do
  desc "Run Inspec tests"
  task :default do
    Rake::Task["ansible:build"].invoke()
    Rake::Task["inspec:default"].invoke()
  end
end

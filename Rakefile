require_relative './environment.rb'
require 'pry'

task :console do
  binding.pry
end

namespace :db do
  task :migrate do
    CreateLinksTable.migrate(:up)
  end

  task :rollback do
    CreateLinksTable.migrate(:down)
  end

  task :reset do
    CreateLinksTable.migrate(:down)
    CreateLinksTable.migrate(:up)
  end
end

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
    CreateLinksTabe.migrate(:down)
    CreateLinksTable.migrate(:up)
  end

  # task :seed do
  #     Link.find_or_create_by(
  #       link_id:,
  #       user_id:,
  #       post_id:,
  #     )
  #   end
  end
end

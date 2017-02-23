require_relative './environment.rb'

namespace :db do
  task :create do
    conn = PG.connect(dbname: 'postgres')
    conn.exec("CREATE DATABASE tntbot_production")
  end

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

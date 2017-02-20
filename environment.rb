require 'active_record'

# recursviely requires all files in ./lib and down that end in .rb
Dir.glob('./lib/*.rb').each do |file|
  require file
end

Dir.glob("./db/migrations/*.rb").each do |file|
  require file
end

# tells AR what db file to use
ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'db/tntbot.db'
)

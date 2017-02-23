require 'active_record'

# recursviely requires all files in ./lib and down that end in .rb
Dir.glob('./models/*.rb').each do |file|
  require file
end

Dir.glob("./db/migrations/*.rb").each do |file|
  require file
end


db = URI.parse(ENV['DATABASE_URL'])
ActiveRecord::Base.establish_connection(
          :adapter => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
          :host     => db.host,
          :username => db.user,
          :password => db.password,
          :database => db.path[1..-1],
          :encoding => 'utf8'
  )

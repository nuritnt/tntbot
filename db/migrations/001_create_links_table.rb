require_relative '../../environment'

class CreateLinksTable < ActiveRecord::Migration
    def up
      create_table :links do |t|
        t.string :title
        t.string :user_id
        t.string :channel_id
        t.string :url

        t.timestamps
      end
    end

    def down
      drop_table :links
    end
end

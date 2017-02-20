require_relative '../../environment'

class CreateLinksTable < ActiveRecord::Migration
    def up
      create_table :links do |t|
        t.string :link_id
        t.string :user_id
        t.string :post_id
      end
    end

    def down
      drop_table :links
    end
end

class CreateLink < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :url
      t.string :title
      t.boolean :read
    end
  end
end

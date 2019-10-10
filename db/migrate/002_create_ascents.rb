class CreateAscents < ActiveRecord::Migration
  def change
    create_table :ascents do |t|
      t.integer :user_id
      t.integer :peak_id
      t.datetime :datetime
      t.string :route
    end
  end
end
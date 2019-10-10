class CreatePeaks < ActiveRecord::Migration
    def change
      create_table :peaks do |t|
        t.string :name
        t.string :location
        t.string :elevation
        t.string :route
      end
    end
end
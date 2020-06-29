class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :name
      t.string :style
      t.integer :rating
      t.integer :user_id
    end
  end
end

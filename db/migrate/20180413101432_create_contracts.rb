class CreateContracts < ActiveRecord::Migration[5.1]
  def change
    create_table :contracts do |t|
      t.string :vendor
      t.decimal :price
      t.integer :user_id
      t.date :starts_on
      t.date :ends_on

      t.timestamps
    end
  end
end

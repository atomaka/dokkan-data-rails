class CreateSuperAttacks < ActiveRecord::Migration
  def change
    create_table :super_attacks do |t|
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end

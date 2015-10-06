class CreateAwakenTypes < ActiveRecord::Migration
  def change
    create_table :awaken_types do |t|
      t.string :name

      t.timestamps null: false
    end

    add_reference :cards, :awaken_type, index: true
  end
end

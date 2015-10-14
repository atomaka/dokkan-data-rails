class CreateEvidences < ActiveRecord::Migration
  def change
    create_table :evidences do |t|
      t.attachment :screenshot

      t.timestamps null: false
    end
  end
end

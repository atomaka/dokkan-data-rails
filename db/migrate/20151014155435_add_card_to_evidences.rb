class AddCardToEvidences < ActiveRecord::Migration
  def change
    add_reference :evidences, :card, index: true
  end
end

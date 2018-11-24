class AddedAssociations < ActiveRecord::Migration[5.2]
  def change
    add_reference :habits, :user, index: true
    add_reference :days, :user, index: true
  end
end

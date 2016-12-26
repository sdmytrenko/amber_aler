class AddImageToEmergencies < ActiveRecord::Migration[5.0]
  def change
    add_column :emergencies, :image, :string
  end
end

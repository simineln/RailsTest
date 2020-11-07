class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :second_name
      t.integer :library_id

      t.timestamps
    end
  end
end

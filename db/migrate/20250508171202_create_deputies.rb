class CreateDeputies < ActiveRecord::Migration[7.2]
  def change
    create_table :deputies do |t|
      t.string :name
      t.string :cpf
      t.integer :external_id
      t.string :party
      t.string :state
      t.integer :legislature

      t.timestamps
    end
  end
end

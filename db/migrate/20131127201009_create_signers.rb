class CreateSigners < ActiveRecord::Migration
  def change
    create_table :signers do |t|
      t.string :name
      t.string :email
      t.string :collective
      t.string :state
      t.text :comment

      t.timestamps
    end
  end
end

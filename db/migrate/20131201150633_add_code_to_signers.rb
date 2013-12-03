class AddCodeToSigners < ActiveRecord::Migration
  def change
    add_column :signers, :code, :string
  end
end

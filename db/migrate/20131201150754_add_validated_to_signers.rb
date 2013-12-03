class AddValidatedToSigners < ActiveRecord::Migration
  def change
    add_column :signers, :validated, :boolean, :default => false
  end
end

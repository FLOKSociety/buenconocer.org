class AddUrlToSigners < ActiveRecord::Migration
  def change
    add_column :signers, :url, :string
  end
end

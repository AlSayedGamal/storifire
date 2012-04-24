class AddVerbToStep < ActiveRecord::Migration
  def change
    add_column :steps, :verb, :string

  end
end

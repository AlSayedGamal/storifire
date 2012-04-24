class AddDoerToStep < ActiveRecord::Migration
  def change
    add_column :steps, :doer, :string

  end
end

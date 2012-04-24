class FixTypeColumnSteps < ActiveRecord::Migration
  def up
  	rename_column :steps, :type, :kind
  end

  def down
  	rename_column :steps, :kind, :type
  end
end

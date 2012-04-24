class FixPointsField < ActiveRecord::Migration
  def up
  	change_column :stories, :points, :decimal
  end

  def down
  	change_column :stories, :points, :integer
  end
end

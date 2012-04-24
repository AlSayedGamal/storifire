class AddStoryIdToStep < ActiveRecord::Migration
  def change
    add_column :steps, :story_id, :integer

  end
end

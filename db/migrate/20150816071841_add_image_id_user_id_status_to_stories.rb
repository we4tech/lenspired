class AddImageIdUserIdStatusToStories < ActiveRecord::Migration
  def change
    add_column :stories, :image_id, :string, null: false
    add_column :stories, :user_id, :integer, null: false
    add_column :stories, :status, :integer, default: 1, null: false
  end
end

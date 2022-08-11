class AddColumnClickedSlug < ActiveRecord::Migration[7.0]
  def change
    add_column :links, :slug, :string
    add_column :links, :clicked, :integer, default: 0
  end
end

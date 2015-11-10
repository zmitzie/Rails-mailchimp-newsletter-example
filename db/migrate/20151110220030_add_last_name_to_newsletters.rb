class AddLastNameToNewsletters < ActiveRecord::Migration
  def change
    add_column :newsletters, :last_name, :string
  end
end

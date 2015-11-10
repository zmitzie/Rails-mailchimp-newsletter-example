class AddFirstNameToNewsletters < ActiveRecord::Migration
  def change
    add_column :newsletters, :first_name, :string
  end
end

class AddintroductionTOusers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :introduction, :text
  end
end

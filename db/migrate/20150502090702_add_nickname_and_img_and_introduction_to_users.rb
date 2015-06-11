class AddNicknameAndImgAndIntroductionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :nickname, :string
    add_column :users, :img, :string
    add_column :users, :introduction, :string
  end
end

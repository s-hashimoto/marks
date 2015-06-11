class AddHyakumeizanAndRubyToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :hyakumeizan, :string
    add_column :places, :ruby, :string
  end
end

class RemoveHyakumeiAndRubyFromPlaces < ActiveRecord::Migration
  def change
    remove_column :places, :Hyakumei, :string
    remove_column :places, :Ruby, :string
  end
end

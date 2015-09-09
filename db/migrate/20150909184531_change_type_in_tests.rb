class ChangeTypeInTests < ActiveRecord::Migration
  def change
  	rename_column :tests, :type, :typeinput
  end
end

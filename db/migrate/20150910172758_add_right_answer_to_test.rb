class AddRightAnswerToTest < ActiveRecord::Migration
  def change
    add_column :tests, :right_answer, :string
  end
end

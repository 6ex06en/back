class ChangeRightAnswerFromTest < ActiveRecord::Migration
  def change
  	remove_column :tests, :right_answer
  	add_column :tests, :right_answer, :text, array:true, default:[]
  end
end

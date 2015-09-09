class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.string :question
      t.integer :score
      t.text :answers, array:true, default:[]
      t.string :type
      t.integer :checksum, index:true
      t.timestamps null: false
    end
  end
end

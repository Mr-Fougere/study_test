class CreateQuestionsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|

      t.text :question
      t.text :answer1
      t.text :answer2
      t.text :answer3
      t.text :answer4
      t.integer :goodAnswer
      t.string :theme
      t.string :category
    end
  end
end

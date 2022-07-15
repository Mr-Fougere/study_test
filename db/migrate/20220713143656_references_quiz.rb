class ReferencesQuiz < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :quizzes, :questions, column: :question1_id , primary_key: "id"    
    add_foreign_key :quizzes, :questions, column: :question2_id , primary_key: "id"    
    add_foreign_key :quizzes, :questions, column: :question3_id , primary_key: "id"    
    add_foreign_key :quizzes, :questions, column: :question4_id , primary_key: "id"    
    add_foreign_key :quizzes, :questions, column: :question5_id , primary_key: "id"    
  end
end

class UptQuizzes < ActiveRecord::Migration[7.0]
  def change
      add_column("quizzes",'tempQuestion',"string")
  end
end

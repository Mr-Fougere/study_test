class AddDefaultQuizzes < ActiveRecord::Migration[7.0]
  def up

 20.times do |i|
    Quiz.create(id:i+1,question1_id:rand(1..20),question2_id:rand(1..20),question3_id:rand(1..20),question4_id:rand(1..20),question5_id:rand(1..20),difficulty:rand(1..4))
 end
  end
end

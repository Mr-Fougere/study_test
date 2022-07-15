class CreateQuizTable < ActiveRecord::Migration[7.0]
  def change
    create_table :quiz do |t|

      t.bigint :difficulty
      t.bigint :question1_id
      t.bigint :question2_id
      t.bigint :question3_id
      t.bigint :question4_id
      t.bigint :question5_id

    end

  end
end

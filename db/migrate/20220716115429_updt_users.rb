class UpdtUsers < ActiveRecord::Migration[7.0]
  def change
    add_column("users",'currentQuiz',"bigInt")
    add_column("users","currentQuestion","integer")
    add_column("users","goodAnswer","integer")

  end
end

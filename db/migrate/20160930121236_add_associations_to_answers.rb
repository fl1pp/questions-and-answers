class AddAssociationsToAnswers < ActiveRecord::Migration[5.0]
  def change
  	add_column :answers, :question_id, :integer
  	add_column :answers, :user_id, :integer
  end
end

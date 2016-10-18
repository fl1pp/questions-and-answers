class AddAssociationsToCorrections < ActiveRecord::Migration[5.0]
  def change
    add_column :corrections, :question_id, :integer
  	add_column :corrections, :answer_id, :integer
  	add_column :corrections, :user_id, :integer
  end
end

class CreateCorrections < ActiveRecord::Migration[5.0]
  def change
    create_table :corrections do |t|
      t.text :content

      t.timestamps
    end
  end
end

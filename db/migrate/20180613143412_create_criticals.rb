class CreateCriticals < ActiveRecord::Migration[5.1]
  def change
    create_table :criticals do |t|
      t.string :title
      t.text :text
      t.date :date
      t.references :user, foreign_key: true
      t.references :movie, foreign_key: true
      t.references :tvshow, foreign_key: true
      t.timestamps
    end
  end
end

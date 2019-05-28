class CreateSidekicks < ActiveRecord::Migration[5.2]
  def change
    create_table :sidekicks do |t|
      t.string :name
      t.string :power
      t.string :hero
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end

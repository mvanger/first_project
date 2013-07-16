class CreateTeams < ActiveRecord::Migration
  def up
    create_table :teams do |t|
      t.belongs_to :users
      t.string :abbreviation
      t.string :city
      t.string :name
      t.timestamps
    end
  end

  def down
    drop_table :teams
  end
end

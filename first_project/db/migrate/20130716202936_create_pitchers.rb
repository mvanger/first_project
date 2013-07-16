class CreatePitchers < ActiveRecord::Migration
  def up
    create_table :pitchers do |t|
      t.belongs_to :team
      t.belongs_to :user
      t.string :first
      t.string :last
      t.string :team
      t.timestamps
    end
  end

  def down
    drop_table :pitchers
  end
end

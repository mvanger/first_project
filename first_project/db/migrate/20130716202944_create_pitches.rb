class CreatePitches < ActiveRecord::Migration
  def up
    create_table :pitches do |t|
      t.belongs_to :pitcher
      t.float :mph
      t.timestamps
    end
  end

  def down
    drop_table :pitches
  end
end

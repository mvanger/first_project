class CreateSecondJoinTable < ActiveRecord::Migration
  def up
    create_table :pitchers_users, :id => false do |t|
      t.belongs_to :pitcher
      t.belongs_to :user
    end
  end

  def down
    drop_table :pitchers_users
  end
end
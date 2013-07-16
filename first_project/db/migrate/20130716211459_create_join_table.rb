class CreateJoinTable < ActiveRecord::Migration
  def up
    create_table :teams_users, :id => false do |t|
      t.belongs_to :team
      t.belongs_to :user
    end
  end

  def down
    drop_table :teams_users
  end
end

class AddYearColumn < ActiveRecord::Migration
  def change
    add_column :pitches, :year, :integer, default: 2013
  end
end

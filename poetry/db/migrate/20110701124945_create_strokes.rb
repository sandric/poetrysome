class CreateStrokes < ActiveRecord::Migration
  def self.up
    create_table :strokes do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :strokes
  end
end

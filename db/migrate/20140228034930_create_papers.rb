class CreatePapers < ActiveRecord::Migration
  def self.up
    create_table :papers do |t|
      t.string :subject
      t.string :grade
      t.date :year
      t.timestamps
    end
  end

  def self.down
    drop_table :papers
  end
end

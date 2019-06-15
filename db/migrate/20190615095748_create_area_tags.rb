class CreateAreaTags < ActiveRecord::Migration[5.2]
  def change
    create_table :area_tags do |t|
      t.references :area, foreign_key: true
      t.references :tag, foreign_key: true
    end
  end
end

class CreateAreaTags < ActiveRecord::Migration[5.2]
  def change
    create_table :area_tags do |t|
      t.references :area
      t.references :tag
    end
  end
end

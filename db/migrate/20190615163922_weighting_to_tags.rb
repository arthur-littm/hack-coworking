class WeightingToTags < ActiveRecord::Migration[5.2]
  def change
    add_column :tags, :weighting, :float, default: 1.0
  end
end

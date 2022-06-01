class CreateFreamworks < ActiveRecord::Migration[7.0]
  def change
    create_table :frameworks do |t|
      t.string :name
      t.string :description
      t.string :file
      t.integer :user_id
      t.integer :theme_id
      t.float :value, :default => 0

      t.timestamps
    end
    change_table :values do |t|
      t.rename 'image_id', 'framework_id'
    end
  end
end

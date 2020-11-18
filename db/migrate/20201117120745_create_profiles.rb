class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.references :user, null:false
      t.string     :job
      t.string     :hobby
      t.integer    :gender_id
      t.string     :skill
      t.integer    :area_id
      t.text       :free
      t.timestamps
    end
  end
end

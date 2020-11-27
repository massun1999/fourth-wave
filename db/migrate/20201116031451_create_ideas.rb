class CreateIdeas < ActiveRecord::Migration[6.0]
  def change
    create_table :ideas do |t|
      t.string      :title, null:false
      t.text        :text, null:false
      t.integer     :category_id, null:false
      t.integer     :format_id
      t.references  :user , null:false, foreign_key:true
      t.timestamps
    end
  end
end

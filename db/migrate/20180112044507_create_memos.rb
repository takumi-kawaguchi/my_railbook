class CreateMemos < ActiveRecord::Migration[5.1]
  def change
    create_table :memos do |t|
      t.references :memoable, polimorphic: true
      t.string :body

      t.timestamps
    end
  end
end
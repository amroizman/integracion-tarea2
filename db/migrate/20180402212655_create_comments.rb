class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :author
      t.string :comment
      t.integer :article_id

      t.timestamps
    end
  end
end

class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :user_id
      t.string :user_email
      t.integer :post_id
      t.string :state

      t.timestamps
    end
  end
end

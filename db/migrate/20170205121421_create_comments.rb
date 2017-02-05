class CreateComments < ActiveRecord::Migration[5.0]
  def change
    drop_table 'comments' if ActiveRecord::Base.connection.table_exists? 'comments'
    
    create_table :comments do |t|
      t.text :body
      t.references :article, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

class CreateHostelPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :hostel_posts do |t|
      t.string :hostel_name
      t.string :image
      t.integer :rating
      t.string :event_review
      t.string :social_review
      t.string :additional_comment
      t.integer :user_id
      t.boolean :currently_staying
      t.string :country

      t.timestamps
    end
  end
end

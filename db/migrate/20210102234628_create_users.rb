class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :sun
      t.string :moon
      t.string :ascending
      t.string :mercury
      t.string :venus
      t.string :mars
      t.date :birthday
      t.datetime :birth_time
      t.string :birth_location
      t.integer :gender
      t.integer :interested_in
      t.integer :seen_by
      t.string :pronouns
      t.text :bio
      t.string :current_location
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end

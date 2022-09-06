class CreateAdresses < ActiveRecord::Migration[6.1]
  def change
    create_table :adresses do |t|

      t.timestamps
    end

     t.string :name
     t.string :postal_code
     t.string :address

  end
end

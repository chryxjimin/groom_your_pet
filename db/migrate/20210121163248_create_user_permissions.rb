class CreateUserPermissions < ActiveRecord::Migration[6.0]
  def change
    create_table :user_permissions do |t|
      t.boolean :allow_create_owners 
      t.boolean :allow_create_pets 
      t.boolean :allow_create_appointments
    end
  end
end

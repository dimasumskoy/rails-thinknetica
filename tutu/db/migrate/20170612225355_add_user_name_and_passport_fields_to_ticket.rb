class AddUserNameAndPassportFieldsToTicket < ActiveRecord::Migration[5.1]
  def change
    change_table :tickets do |t|
      t.text :first_name
      t.text :middle_name
      t.text :last_name
      t.text :passport_data
    end
  end
end

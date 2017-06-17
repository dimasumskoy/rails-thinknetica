class AddUserNameAndPassportFieldsToTicket < ActiveRecord::Migration[5.1]
  def change
    change_table :tickets do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :passport_number
    end
  end
end

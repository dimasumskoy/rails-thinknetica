class AddTimestampsToRoutes < ActiveRecord::Migration[5.1]
  def change
    change_table :routes do |t|
      t.datetime :created_at
      t.datetime :updated_at
    end
    change_column_null :routes, :created_at, false
    change_column_null :routes, :updated_at, false
  end
end

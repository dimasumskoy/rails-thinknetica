require_relative '20170514191548_create_routes'

class FixRoutesNames < ActiveRecord::Migration[5.1]
  def change
    revert CreateRoutes

    create_table :routes do |t|
      t.string :name
    end
  end
end

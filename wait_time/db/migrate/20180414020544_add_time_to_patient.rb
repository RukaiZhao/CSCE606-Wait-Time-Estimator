class AddTimeToPatient < ActiveRecord::Migration[5.1]
  def change
    add_column :patients, :time, :string
  end
end

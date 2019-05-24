class AddPowerToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :power, :string
  end
end

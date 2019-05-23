class Project < ApplicationRecord
  belongs_to :user

  def self.all_projects(id)
    Project.find_by_sql("SELECT * FROM projects AS p WHERE #{id} = p.user_id")
  end

end

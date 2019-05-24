class Project < ApplicationRecord
  belongs_to :user

  def self.all_projects(id)
    Project.find_by_sql("
    SELECT * 
    FROM projects AS p 
    WHERE #{id} = p.user_id
    ")
  end

  def self.single_project(user_id, id)
    Project.find_by_sql(["
      SELECT *
      FROM projects AS p
      WHERE p.user_id = ? AND p.id = ?
    ", user_id, id]).first
  end

  def self.create_project(p, id)
    Project.find_by_sql(["
      INSERT INTO projects (title, user_id, created_at, updated_at)
      VALUES (:title, :user_id, :created_at, :updated_at)",
      {
        title: p[:title],
        user_id: id,
        created_at: DateTime.now,
        updated_at: DateTime.now
    }])
  end

end

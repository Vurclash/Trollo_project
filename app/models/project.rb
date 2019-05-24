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

  def self.update_project(project_id, t)
    Project.find_by_sql(["
      UPDATE projects AS p
      SET title = ?, power = ?, updated_at = ?
      WHERE p.id = ?
    ", t[:title], t[:power], DateTime.now, project_id])
  end

  def self.delete_project(project_id)
    Project.find_by_sql(["
      DELETE FROM projects AS p
      WHERE p.id = ?
    ", project_id])
  end

end

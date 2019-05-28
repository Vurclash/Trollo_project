class Sidekick < ApplicationRecord
  belongs_to :user

  def self.all_sidekicks(id)
    Sidekick.find_by_sql("
    SELECT * 
    FROM sidekicks AS s
    WHERE #{id} = s.user_id
    ")
  end

  def self.single_sidekick(user_id, id)
    Sidekick.find_by_sql(["
      SELECT *
      FROM sidekick AS s
      WHERE s.user_id = ? AND s.id = ?
    ", user_id, id]).first
  end

  def self.create_sidekick(s, id)
    Sidekick.find_by_sql(["
      INSERT INTO sidekick (name, user_id, created_at, updated_at)
      VALUES (:name, :user_id, :created_at, :updated_at)",
      {
        name: s[:name],
        user_id: id,
        created_at: DateTime.now,
        updated_at: DateTime.now
    }])
  end

  def self.update_sidekick(sidekick_id, t)
    Sidekick.find_by_sql(["
      UPDATE sidekicks AS s
      SET name = ?, power = ?, hero = ?, updated_at = ?
      WHERE p.id = ?
    ", t[:name], t[:power], t[:hero], DateTime.now, project_id])
  end

  def self.delete_sidekick(sidekick_id)
    Sidekick.find_by_sql(["
      DELETE FROM sidekicks AS s
      WHERE s.id = ?
    ", sidekick_id])
  end
end

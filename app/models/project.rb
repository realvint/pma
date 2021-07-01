class Project < ApplicationRecord
  has_many :tasks
  belongs_to :user

  BADGE_COLOR = {
    'not-started' => 'secondary',
    'in-progress' => 'info',
    'complete' => 'success'
  }.freeze

  def badge_color
    BADGE_COLOR[status]
  end

  def status
    return 'not-started' if tasks.none?

    if tasks.all? { |task| task.complete? }
      'complete'
    elsif tasks.any? { |task| task.in_progress? || task.complete? }
      'in-progress'
    else
      'not-started'
    end
  end

  def percent_complete
    return 0 if tasks.none?

    ((total_complete.to_f / total_tasks) * 100).round
  end

  def total_complete
    tasks.select { |task| task.complete? }.count
  end

  def total_tasks
    tasks.count
  end
end

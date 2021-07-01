class Task < ApplicationRecord
  belongs_to :project

  validates :status, inclusion: { in: %w[not-started in-progress complete] }

  STATUS_OPTIONS = [['Not started', 'not-started'], ['In progress', 'in-progress'], ['Complete', 'complete']].freeze
  BADGE_COLOR = {
    'not-started' => 'secondary',
    'in-progress' => 'info',
    'complete' => 'success'
  }.freeze
  def badge_color
    BADGE_COLOR[status]
  end

  def complete?
    status == 'complete'
  end

  def in_progress?
    status == 'in-progress'
  end

  def not_started?
    status == 'not-started'
  end
end

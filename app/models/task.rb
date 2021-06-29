class Task < ApplicationRecord
  belongs_to :project

  validates :status, inclusion: { in: %w[not-started in-progress complete] }

  STATUS_OPTIONS = [['Not started', 'not-started'], ['In progress', 'in-progress'], ['Complete', 'complete']].freeze
end

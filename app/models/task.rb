class Task < ApplicationRecord
  # after_create_commit -> { broadcast_prepend_later_to "tasks" }
  # after_update_commit -> { broadcast_replace_later_to "tasks" }
  # after_destroy_commit -> { broadcast_remove_to "tasks" }
  # The three callbacks above are equivalent to the following
  broadcasts_to ->(task) { "tasks" }, inserts_by: :prepend

  validates :title, presence: true

  scope :ordered, -> { order(id: :desc) }
end

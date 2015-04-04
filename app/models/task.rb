class Task < ActiveRecord::Base
	validates :product, presence: true
	validates :doc_type, presence: true, inclusion: { in: %w(Datasheet Manual QIG), message: "Document Type must be a Datasheet, Manual, or QIG" }
	validates :status, presence: true, inclusion: { in: %w(Queued In\ Progress Pending), message: "must be Queued, In Progress, or Pending" }
end

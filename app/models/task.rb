class Task < ActiveRecord::Base
	validates :product,  presence: true
	validates :doc_type, inclusion: { in: %w(Datasheet Manual QIG), message: "Document Type must be a Datasheet, Manual, or QIG" }
	validates :status, inclusion: { in: %w(Queued In\ Progress Pending), message: "must be Queued, In Progress, or Pending" }
	before_validation :default_values

	def days_since_draft
		(Date.today - read_attribute(:draft_submitted)).to_i
	end

	private
	def default_values
		self.status ||= "Queued"
		self.start_date ||= Date.today
	end
end

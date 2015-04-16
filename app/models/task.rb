class Task < ActiveRecord::Base
	attr_accessor :documents

	belongs_to :writer, class_name: 'User'
	belongs_to :peer_reviewer, class_name: 'User'

	validates :product,  presence: true
	validates :doc_type, inclusion: { in: %w(Datasheet Manual QIG), message: "must be a Datasheet, Manual, or QIG" }
	validates :status, inclusion: { in: %w(Queued In\ Progress Pending), message: "must be Queued, In Progress, or Pending" }
	validates :review_status, inclusion: { in: %w(Not\ Sent Sent Reviewed), message: "must be Not Sent or Sent, or Reviewed" }
	before_validation :default_values

	def name
		"#{self.product} #{self.revision} #{self.doc_type} #{self.version} (#{self.region})"
	end

	def writer
		return User.find_by(id: self.writer_id).name
	end

	def reviewer
		return User.find_by(id: self.reviewer_id).name
	end

	private
	def default_values
		self.status ||= "Queued"
		self.start_date ||= Date.today
		self.done ||= false
		self.review_status ||= "Not Sent"
		return true # To prevent a false return value!
	end
end

class User < ActiveRecord::Base
	has_many :tasks, foreign_key: 'writer_id'
	has_many :peer_reviews, class_name: 'Task', foreign_key: 'reviewer_id'

	validates :name, presence: true
	validates :email, presence: true

	# Returns a hash in the form { name => id }
	def self.get_options_for_select
		Hash[self.all.pluck(:name, :id).map {|k,v| [k,v]}]
	end
end

class User < ActiveRecord::Base
	before_save do
		self.name = name.capitalize
		self.email = email.downcase
	end

	has_many :tasks, foreign_key: 'writer_id'
	has_many :peer_reviews, class_name: 'Task', foreign_key: 'reviewer_id'

	validates :name, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, uniqueness: { case_sensitive: false },
					format: { with: VALID_EMAIL_REGEX }, length: { maximum: 255 }

	has_secure_password
	validates :password, length: { minimum: 3 }

	# Returns a hash in the form { name => id, ... }
	def self.get_options_for_select
		Hash[self.all.pluck(:name, :id).map {|k,v| [k,v]}]
	end
end

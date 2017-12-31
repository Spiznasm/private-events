class Event < ApplicationRecord
	has_many :invites, foreign_key: "event_id", dependent: :destroy
  has_many :attendees, through: :invites, source: "attendee", dependent: :destroy
	belongs_to :host, class_name: "User"

	def self.upcoming
		self.where("date > ?", DateTime.now).order("date ASC")
	end

	def self.past
		self.where("date < ?", DateTime.now).order("date ASC")
	end

end

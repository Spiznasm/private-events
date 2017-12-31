class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable

   has_many :invites, foreign_key: "attendee_id", dependent: :destroy
   has_many :attended_events, through: :invites, source: "event", dependent: :destroy
   has_many :hosted_events, foreign_key: "host_id", class_name: "Event", dependent: :destroy
   

   def upcoming
   	self.where("date > ?",DateTime.now).order("date ASC")
   end

   def past
   	self.where("date < ?",DateTime.now).order("date ASC")
   end

end

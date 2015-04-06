class Company < ActiveRecord::Base
	belongs_to :user
	has_many :jobs
	has_and_belongs_to_many :locations
end

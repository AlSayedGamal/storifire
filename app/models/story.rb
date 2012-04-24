class Story < ActiveRecord::Base
	belongs_to :role
	has_many :steps
end
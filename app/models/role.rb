class Role < ActiveRecord::Base
  has_many :stories
  belongs_to :project
  belongs_to :role
end

class Stamp < ActiveRecord::Base
	belongs_to :user
	validates_presence_of :label
end

class StampSetting < ActiveRecord::Base
	belongs_to :stamp 
	serialize :settings
end

class Stamp < ActiveRecord::Base
	belongs_to :user
	validates_presence_of :email
	has_one :setting, :class_name => "StampSetting"
end

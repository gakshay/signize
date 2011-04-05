class Stamp < ActiveRecord::Base
	belongs_to :user
	validates_presence_of :email
	has_one :setting, :class_name => "StampSetting"
	
	attr_writer :current_step
	
	def current_step
		@current_step || steps.first
	end
	
	def steps
		%w[email choose design]
	end
	
	def next_step
		self.current_step = steps[steps.index(current_step) + 1]
	end
	
	def previous_step
		self.current_step = steps[steps.index(current_step) - 1 ]
	end
	
	def first_step?
		current_step == steps.first
	end
	
	def last_step?
		current_step == steps.last
	end
	
	def templates
		@templates = []
    Dir.glob( File.join( Rails.root.to_s , 'public' ,'templates', 'sign_*', "*.html.erb") ).each do |template|
      @templates << template
    end
	end
end

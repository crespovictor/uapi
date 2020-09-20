class Stat < ApplicationRecord

	# validation
	validates_presence_of :online
    validates_presence_of :switch
    validates_presence_of :countdown
    validates_presence_of :current
    validates_presence_of :power
    validates_presence_of :voltage
    validates_presence_of :date_time
end

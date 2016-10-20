class TermsSemister < ActiveRecord::Base

	#Validations
	validates :name, presence: true, :length => { :minimum => 2 }
	validates :start_date, presence: true, message: "must be at least #{(Date.today + 1).to_s}" }, :on => :create
	validates :end_date, presence: true, date: { after_or_equal_to:  :start_date}
	validates :vacation_date, presence: true, date: { after_or_equal_to: Proc.new { Date.today }, message: "must be at least #{(Date.today + 1).to_s}" }, :on => :create
	validates :reopening_date, presence: true, date: { after_or_equal_to:  :vacation_date}

end

class Batch < ActiveRecord::Base

	#Associations
	has_many :subjects

	#Validations
	validates :name, presence: true, :length => { :minimum => 2 }
	validates :code, presence: true
	validates :start_date, presence: true, date: { after_or_equal_to: Proc.new { Date.today }, message: "must be at least #{(Date.today + 1).to_s}" }
	validates :end_date, presence: true, date: { after_or_equal_to:  :start_date}
end

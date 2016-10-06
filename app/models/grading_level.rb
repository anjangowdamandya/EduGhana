class GradingLevel < ActiveRecord::Base

	#Validations
	validates :name, presence: true, :length => { :minimum => 3 }
	validates :minimum_marks, presence: true, :numericality => {:only_integer => true}
	validates :maximum_marks, presence: true, :numericality => {:only_integer => true}
	validates :grade_point, presence: true
end

class Exam < ActiveRecord::Base

	#Validations
	validates :name, presence: true, :length => { :minimum => 3 }
	validates :minimum_marks, presence: true, :numericality => {:only_integer => true}
	validates :maximum_marks, presence: true, :numericality => {:only_integer => true}
	validates :weightage, presence: true
end

class Grading < ActiveRecord::Base

	#Association
	belongs_to :report_type, :foreign_key => 'report_id'

	#Validations
	validates :report_id, presence: true
	validates :minimum_marks, presence: true, :numericality => {:only_integer => true}
end

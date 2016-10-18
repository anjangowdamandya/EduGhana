class Subject < ActiveRecord::Base

	#Associations
	belongs_to :batch

  	belongs_to :user, :foreign_key => 'employee_id'

	#Validations
	validates :name, presence: true, :length => { :minimum => 2 }
	validates :subject_type, presence: true
	validates :batch_id, presence: true
end

class Subject < ActiveRecord::Base

	#Associations
	belongs_to :batch

	#Validations
	validates :name, presence: true, :length => { :minimum => 2 }
	validates :subject_type, presence: true
	validates :batch_id, presence: true
end

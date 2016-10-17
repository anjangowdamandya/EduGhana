class ReportType < ActiveRecord::Base

	#Associations
	has_many :gradings, :foreign_key => 'report_id'
	has_many :batches, :foreign_key => 'report_id'

	#Validations
	validates :name, presence: true, :length => { :minimum => 3 }
	validates :description, presence: true

end
class School < ActiveRecord::Base
  validates :name, presence: true, :length => { :minimum => 2 }
  validates :address, presence: true
  validates :telephone, presence: true
  validates :email, presence: true

  validates :email, :format => {:with => /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i,
                               :multiline => true,
                               :if => proc {|school| school.email.present? }}
end

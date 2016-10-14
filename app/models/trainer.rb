class Trainer < ActiveRecord::Base
	has_many :tokimons, :dependent => :destroy
	validates :tname, :presence => true
end

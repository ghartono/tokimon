class Tokimon < ActiveRecord::Base
	belongs_to :trainer
        validates :name, :height , :weight, :fly, :fight, :fire, :water, :electric, :ice, :trainer_id, :presence => true
	validates :height, :weight, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
	validates :fly, :fight, :fire, :water, :electric, :ice, numericality: { only_integer: true, 
		greater_than_or_equal_to: 0, less_than_or_equal_to: 100}
	validates :name, uniqueness: true
end

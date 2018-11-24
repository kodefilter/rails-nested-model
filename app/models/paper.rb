class Paper < ActiveRecord::Base
  has_many :questions, dependent: :destroy
  
  accepts_nested_attributes_for :questions, reject_if: proc { |attributes| attributes['content'].blank? }, :allow_destroy => true
  
  
end

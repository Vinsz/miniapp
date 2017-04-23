class List < ApplicationRecord
  belongs_to :user
  has_many :tasks, inverse_of: :list, :dependent => :destroy
  accepts_nested_attributes_for :tasks, :reject_if => proc {|attributes| attributes['text'].blank? }
end

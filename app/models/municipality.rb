class Municipality < ApplicationRecord
  validates_presence_of :code
  validates_presence_of :name
  belongs_to :province, optional: true
  belongs_to :district, optional: true
end

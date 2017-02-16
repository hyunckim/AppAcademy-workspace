class Band < ActiveRecord::Base
  validates :band_name, presence: true

  has_many :albums, dependent: :destroy
end

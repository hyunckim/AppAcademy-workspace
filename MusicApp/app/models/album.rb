class Album < ActiveRecord::Base
  validates :album_name, :band_id, presence: true
  validates :form, presence: true, inclusion: { in: %w(live studio) }


  belongs_to :band

  has_many :tracks, dependent: :destroy

end

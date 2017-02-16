class Track < ActiveRecord::Base
  validates :track_name, :album_id, presence: true
  validates :form, presence: true, inclusion: { in: %w(bonus regular)}

  belongs_to :album
end

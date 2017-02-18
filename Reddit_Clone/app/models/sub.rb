# == Schema Information
#
# Table name: subs
#
#  id           :integer          not null, primary key
#  title        :string           not null
#  description  :text             not null
#  moderator_id :integer          not null
#  created_at   :datetime
#  updated_at   :datetime
#

class Sub < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :moderator, presence: true

  belongs_to :moderator, inverse_of: :subs,
    class_name: :User

  has_many :post_subs

  has_many :posts,
    through: :post_subs,
    source: :post
end

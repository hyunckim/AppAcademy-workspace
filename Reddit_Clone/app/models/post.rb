# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  url        :string
#  content    :text
#  sub_id     :integer          not null
#  author_id  :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Post < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :sub, presence: true
  validates :author, presence: true

  belongs_to :sub

  belongs_to :author,
    class_name: :User

  has_one :moderator,
    through: :sub,
    source: :moderator
end

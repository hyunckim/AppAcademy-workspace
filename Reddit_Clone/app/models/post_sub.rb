# == Schema Information
#
# Table name: post_subs
#
#  id      :integer          not null, primary key
#  post_id :integer          not null
#  sub_id  :integer          not null
#

class PostSub < ActiveRecord::Base
  validates :post, presence: true, uniqueness: { scope: :sub }
  validates :sub, presence: true

  belongs_to :post
  belongs_to :sub
end
 

# == Schema Information
#
# Table name: post_subs
#
#  id         :integer          not null, primary key
#  sub_id     :integer          not null
#  post_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PostSub < ActiveRecord::Base
  validates :sub, :post, presence: true
  validates :sub_id, uniqueness: { scope: :post_id }

  belongs_to :sub
  belongs_to :post
end

# == Schema Information
#
# Table name: subs
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  description :text
#  user_id     :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Sub < ActiveRecord::Base
  validates :title, uniqueness: { message: "must be unique" }, presence: { message: "can't be blank" }
  validates :moderator, presence: true

  has_many :post_subs,
    class_name: 'PostSub',
    foreign_key: :sub_id,
    dependent: :destroy,
    inverse_of: :sub

  has_many :posts,
    through: :post_subs,
    source: :post

  belongs_to :moderator,
    class_name: 'User',
    foreign_key: :user_id
end

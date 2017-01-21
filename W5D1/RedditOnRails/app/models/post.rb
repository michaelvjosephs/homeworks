# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  url        :string           not null
#  content    :text             not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ActiveRecord::Base
  validates :title, :url, :content, presence: { message: "can't be blank" }
  validates :author, presence: true
  validates :subs, length: { minimum: 1, message: ": must select at least one" }

  has_many :post_subs,
    class_name: 'PostSub',
    foreign_key: :post_id,
    dependent: :destroy,
    inverse_of: :post

  has_many :subs,
    through: :post_subs,
    source: :sub

  belongs_to :author,
    class_name: 'User',
    foreign_key: :user_id

  has_many :comments

end

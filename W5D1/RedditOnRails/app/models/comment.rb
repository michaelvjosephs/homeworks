# == Schema Information
#
# Table name: comments
#
#  id                :integer          not null, primary key
#  content           :text             not null
#  user_id           :integer          not null
#  post_id           :integer          not null
#  parent_comment_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Comment < ActiveRecord::Base
  validates :content, presence: { message: "can't be blank" }
  validates :author, presence: true
  validates :post, presence: true

  belongs_to :author,
    class_name: 'User',
    foreign_key: :user_id

  belongs_to :post

  has_many :child_comments,
    class_name: 'Comment',
    foreign_key: :parent_comment_id
  # 
  # belongs_to :parent_comment,
  #   class_name: 'Comment',
  #   foreign_key: :parent_comment_id

end

User.destroy_all
Sub.destroy_all
Post.destroy_all
PostSub.destroy_all
Comment.destroy_all

user = User.create!(username: 'appacademy', password: 'password')

users = [user]

9.times do
  users << User.create!(
    username: Faker::GameOfThrones.character,
    password: "password"
  )
end

subs = []
users.each do |user|
  subs << Sub.create!(
    title: Faker::Book.title,
    description: Faker::Hipster.sentence,
    user_id: user.id
  )
end

posts = []
users.each do |user|
  subs.each do |subb|
    post = Post.create!(
      title: Faker::Book.title,
      url: Faker::Internet.domain_word,
      content: Faker::Hipster.sentence,
      user_id: user.id,
      sub_ids: Sub.all.pluck(:id).sample(5)
    )
    posts << post
  end
end

comments = []
users.each do |user|
  posts.each do |post|
    comments << Comment.create!(
      content: Faker::Hipster.sentence,
      user_id: user.id,
      post_id: post.id,
      parent_comment_id: nil
    )
  end
end

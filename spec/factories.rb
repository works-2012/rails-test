Factory.define :user do |user|
  user.name                  "Michael Hartl"
  user.email                 "mhartl@example.com"
  user.password              "foobar"
  user.password_confirmation "foobar"
end

Factory.define :post do |post|
  post.title                 "Post's name"
  post.text                  "Post's text"
  post.user_id               "1"
end

Factory.define :tag do |tag|
  tag.text                  "Tag's text"
  tag.post_id               "1"
end

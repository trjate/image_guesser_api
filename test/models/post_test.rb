require 'test_helper'

class PostTest < ActiveSupport::TestCase
  
  test " that a post has many guesses " do
  
    post = posts(:puppy_post)
    assert post.guesses

  end

  test " that a post must require an image_url AND answer to save " do
    
    post = Post.new(image_url: "image_url.com")
    post2 = Post.new(answer: "answer")
    post3 = Post.new
    refute post.save, "Tried to save without an answer"
    refute post2.save, "Tried to save without an image_url"
    refute post3.save, "Tried to save without an image_url and answer"

  end

  test " that a user has many posts " do # is this the same test as "that a post can belong to a user" ?
  
    user = users(:one)
    assert user.posts

  end

end

# frozen_string_literal: true

require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @post = posts(:one)
    @user = users(:one)
    @like = post_likes(:one)
  end

  test 'test_create_like' do
    sign_in @user
    post post_likes_url(@post, locale: :en)
    like = PostLike.find_by! post_id: @post[:id]

    assert { like }
    assert_redirected_to @like.post
  end

  test 'test_destroy_comment' do
    sign_in @user
    delete post_like_url(@post, @like, locale: :en)

    assert { !PostLike.exists? @like.id }

    assert_redirected_to post_url(@post)
  end
end

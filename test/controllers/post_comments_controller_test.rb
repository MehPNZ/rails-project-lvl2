# frozen_string_literal: true

require 'test_helper'

class PostCommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @post = posts(:one)
    @comment = post_comments(:one)
    @user = users(:one)
    @attrs = {
      content: Faker::ChuckNorris.fact,
      parent_id: '1'
    }
  end

  test 'test_create_PostComment' do
    sign_in @user
    post post_comments_url(@post, locale: :en), params: { post_comment: @attrs }
    comment = PostComment.find_by! content: @attrs[:content]

    assert { comment }
    assert_redirected_to post_url(@post, anchor: "comment-#{comment.id}", locale: :en)
  end
end

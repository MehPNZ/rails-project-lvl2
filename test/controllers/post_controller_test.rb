# frozen_string_literal: true

require 'test_helper'

class PostControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @post = posts(:one)
    @user = users(:one)
    @attrs = {
      title: Faker::Movies::HarryPotter.character,
      body: Faker::ChuckNorris.fact,
      category_id: 1
    }
  end
  test 'test_new_post' do
    sign_in @user
    get new_post_path(locale: :en)
    assert_response :success
  end

  test 'test_create_post' do
    sign_in @user
    post posts_url(locale: :en), params: { post: @attrs }
    post = Post.find_by! title: @attrs[:title]

    assert { post }
    assert_redirected_to post_url(post, locale: :en)
  end

  test 'test_show' do
    sign_in @user
    get post_path(@post, locale: :en)

    assert_response :success
  end

  test 'test_index_page' do
    get root_path
    assert_response :success
  end
end

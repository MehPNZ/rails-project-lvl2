require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest

  test 'test_show_with fixture' do
    post = posts(:one)

    get post_path(post)

    assert_response :success
    assert_select 'h1', 'MyString'
    assert_select 'p', 'MyText'
  end

  test 'test_index_page' do
    get root_path

    assert_response :success
    assert_select 'h1', 'Collective blog'
  end 

  test 'test_new_post' do
    get new_post_path

    assert_response :success
    assert_select 'h2', 'New post'
  end

end

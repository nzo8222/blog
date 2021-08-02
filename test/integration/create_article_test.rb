require "test_helper"

class CreateArticleTest < ActionDispatch::IntegrationTest
  test "get new article form and create category" do
    get "/articles/new"
    assert_response :success
    assert_difference 'Article.count', 1 do
      post articles_path, params: { article: { title: "title4", body: "body"} }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "title4", response.body
  end

  test "get new article form and reject invalid article submission" do
    get "/articles/new"
    assert_response :success
    assert_no_difference 'Article.count', 1 do
      post articles_path, params: { article: { title: "", body: "body"} }

    end
    assert_select 'div.alert'

  end
end

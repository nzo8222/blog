require "test_helper"

class ListArticlesTest < ActionDispatch::IntegrationTest
  def setup
  @article = Article.create(title:"title test", body:"body")

  @article2 = Article.create(title:"title test2", body:"body")
  end

  test "should show articles listing" do
    get ''
    assert_select "a[href=?]", article_path(@article), text: @article.title
    assert_select "a[href=?]", article_path(@article2), text: @article2.title
  end
end

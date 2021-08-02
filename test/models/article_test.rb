require "test_helper"

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @article = Article.new(title: "title", body: "body")
  end
  test "article should be valid" do
    assert @article.valid?
  end

  test "title should be present" do
    @article.title = " "
    assert_not @article.valid?
  end

  test "title should be unique" do
    @article.save
    @article2 = Article.new(title: "title")
    assert_not @article2.valid?
  end

  test "title should not be too long" do
    @article.title = "a" * 26
    assert_not @article.valid?
  end

  test "title should not be too short" do
    @article.title = "a"
    assert_not @article.valid?
  end
end

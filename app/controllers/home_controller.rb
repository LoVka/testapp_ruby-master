class HomeController < ApplicationController
  before_action :set_categories
  before_action :set_markdown

  def index
  end

  def post
    @post = Post.find(params[:id])
  end

  def category
    @category = Category.find_by_slug(params[:category])
  end

  private

  def set_categories
    @categories = Category.order(:position)
  end

  def set_markdown
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  end
end

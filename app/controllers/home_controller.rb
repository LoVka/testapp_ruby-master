class HomeController < ApplicationController
  layout 'public'

  before_action :set_markdown

  def index
    @categories = Category.order(order: :asc)
  end

  def post
    @categories = Category.order(order: :asc)
    @post = Post.find(params[:id])
  end

  def category
    @categories = Category.order(order: :asc)
    @category = Category.find_by_slug(params[:category])
  end

  private

  def set_markdown
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  end
end

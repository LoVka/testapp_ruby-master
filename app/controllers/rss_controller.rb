require 'redcarpet/render_strip'

class RSSController < ApplicationController
  before_action :set_markdown

  def latest
    @posts = Post.last(10)
  end

  def category
    @category = Category.find_by_slug(params[:slug])
    @posts = @category.posts.last(10)
  end

  def editorial
    @list = EditorialList.find_by_slug(params[:slug])
    @posts = @list.posts.last(10)
  end

  private

  def set_markdown
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::StripDown)
  end
end

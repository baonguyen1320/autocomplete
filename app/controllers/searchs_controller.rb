class SearchsController < ApplicationController
  def index
    @result = search_for_posts

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.update('posts', partial: 'posts/posts', collection: @result, as: :post)
      end
    end
  end

  def suggestion
    @result = search_for_posts

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.update('suggestions', partial: 'search/suggestions', locals: {results: @result})
      end
    end
  end

  private

  def search_for_posts
    if params[:query].blank?
      Post.all
    else
      Post.search(params[:query], fields: %i[title body], operator: 'or', match: :text_middle)
    end
  end
end
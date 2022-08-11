class LinkController < ApplicationController
  def index
    @link = Link.all
  end

  def show
    @link = Link.find_by(original_url: params[:original_url])
    if @link.nil?
      render 'errors/404', status: 404
    else
      # url_extension = @link.id.to_s(36)
      @link.update_attribute(:clicked, @link.clicked+1)
      redirect_to @link.sanitize
      # @slug = "http://localhost:3000/#{url_extension}"
    end


  end

  def create
    @link = Link.create!(original_url: link_params)
    if @link.save!
      url_extension = @link.id.to_s(36)
      @link.slug = "http://localhost:3000/#{url_extension}"
      @link.original_url = @link.sanitize
      redirect_to @link
    else
      redirect_to 'link/index'
    end
  end

  def send_to_url
    id = params[:slug].to_i(36)
    link = Link.find(id)
    redirect_to link.original_url
  end

  private

  def link_params
    params.require(:link).permit(:original_url)
  end
end

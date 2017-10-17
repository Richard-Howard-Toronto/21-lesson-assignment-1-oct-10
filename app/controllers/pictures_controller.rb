require "active_support/duration"
require "active_support/core_ext/time/calculations"
require "active_support/core_ext/time/acts_like"
require "active_support/core_ext/date/calculations"
require "active_support/core_ext/date/acts_like"


class PicturesController < ApplicationController


    def pictures_created_in_year
      @recent_pictures = Picture.pictures_created_in_year(2017)
    end


    def show_new_pics
        @most_recent_pictures = Picture.most_recent_five
    end

    def show_popular_pictures
        @most_popular_pictures = Pictures.most_popular_pictures
    end

    def index
      @pictures = Picture.all
    end

    def show
      @picture = Picture.find(params[:id])
    end

  def new
    @picture = Picture.new
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])

    @picture.title  = params[:picture][:title]
    @picture.artist = params[:picture][:artist]
    @picture.url    = params[:picture][:url]

    if @picture.save
      redirect_to "/pictures/#{@picture.id}"
    else
      render :edit
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to "/pictures"
  end

  def create
    @picture = Picture.new

    @picture.title = params[:picture][:title]
    @picture.artist = params[:picture][:artist]
    @picture.url = params[:picture][:url]

    if @picture.save
      # if the picture gets saved, generate a get request to "/pictures" (the index)
      redirect_to "/pictures"
    else
      # otherwise render new.html.erb
      render :new
    end
  end
end

class AdminController < ApplicationController

before_filter :basic

  def index
    @areas = Area.where.not("name = 'name'")
    @places = Place.where.not("name = 'name'")
  end

# admin

  def admin_place
    @areas = Area.find_by(:id => params[:id])
    @places = Place.where(:areaid => params[:id])
    @posts = Place.joins(:posts).where(:id => 3)
  end

  def admin_post
    @posts = Post.all.order("id DESC")
  end

# edit

  def edit_area
    @areas = Area.find_by(:id => params[:id])
  end

  def edit_place
    @areas = Area.find_by(:id => params[:first])
    @places = Place.find_by(:id => params[:second])
  end

  def edit_post
    @posts = Post.find(params[:id])
  end

# storong params

  def area_params
    params.require(:area).permit(:img, :name, :description)
    ##ここで示すカラムだけ、↓のupdateで更新できる。
  end

  def place_params
    params.require(:place).permit(:img, :name, :altitude, :description, :ruby)
    ##ここで示すカラムだけ、↓のupdateで更新できる。
  end

  def post_params
    params.require(:post).permit(:title, :description, :author_id, :place_id, :img1, :summit)
    ##ここで示すカラムだけ、↓のupdateで更新できる。
  end

# update

  def update_area
    @areas = Area.find(params[:id])
    if @areas.update(area_params)
          redirect_to "/admin"
    else
          render 'edit_area'
    end
  end

  def update_place
    @places = Place.find(params[:second])
    if @places.update(place_params)
          redirect_to "/admin"
    else
          render 'edit_place'
    end
  end

  def update_post
    @posts = Post.find(params[:id])
    if @posts.update(post_params)
          redirect_to "/admin"
    else
          render 'edit'
    end
  end

# delete

  def delete_post
    @posts = Post.find(params[:id])
    if @posts.destroy
          redirect_to "/admin/post"
    else
          render 'edit'
    end
  end

# basic認証
  def basic
    authenticate_or_request_with_http_basic do |user, pass|
      user == 'marks' && pass == 'admin28'
    end
  end

end


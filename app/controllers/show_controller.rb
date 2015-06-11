class ShowController < ApplicationController

# view系のメソッド
  def top
    @areas = Area.where.not("name = 'name'")
    #↑csv吐き出し時に1行目を取り除くのがめんどいので。
    @posts = Post.order("id DESC").limit(3)
    @users = User.all
  end

  def area
    @areas = Area.find_by(:id => params[:id])
    @places = Place.where(:areaid => params[:id]).order("altitude DESC")
    #postされたパラメータのidから、areaidで探してきて全て出すという作業
    @posts = Post.joins(:place)
  end

  def place
    @areas = Area.find_by(:id => params[:first])
    @places = Place.find_by(:id => params[:second])
    @posts = Post.where(:place_id => params[:second]).order("id DESC").limit(6)
    @satisfyav = Post.where(:place_id => params[:second]).average(:ratesatisfy)
    @dangerav = Post.average(:ratedanger)
    @cntposts = Post.where(:place_id => params[:second]).count
    @users = User.all
  end

  def post
    @posts = Post.new
    @placeid = params[:second]
    @area = Area.find_by(:id => params[:first])
    @place = Place.find_by(:id => params[:second])
    @user = current_user.id
  end


  def logs
    @areas = Area.find_by(:id => params[:first])
    @places = Place.find_by(:id => params[:second])
    @posts = Post.find_by(:id => params[:third])
    @user_id = Post.find_by(:id => params[:third]).user_id
    @users = User.find_by(:id => @user_id)
    @cnt_summit = Post.where(:user_id => @user_id).count
  end

  def select_place
    @areas = Area.where.not("name = 'name'")
  end

#　strong parameter系のメソッド
  def post_params
    params.require(:post).permit(:title, :description, :user_id, :place_id, :img1, :img2, :img3, :img4, :summit, :start_point, :end_point)
    ##ここで示すカラムだけ、↓のupdateで更新できる。
  end

# create系のメソッド
  def create_post
    @posts = Post.new
    @posts.img1 = params[:post][:img1]
    @posts.img2 = params[:post][:img2]
    @posts.img3 = params[:post][:img3]
    @posts.title = params[:post][:title]
    @posts.description = params[:post][:description]
    @posts.ratedanger = params[:post][:ratedanger]
    @posts.ratesatisfy = params[:post][:ratesatisfy]
    @posts.nights = params[:post][:nights]
    @posts.year = params[:post][:year]
    @posts.month = params[:post][:month]
    @posts.date = params[:post][:date]
    @posts.place_id = params[:post][:place_id]
    @posts.user_id = params[:post][:user_id]
    @posts.summit = params[:post][:summit]
    @posts.start_point = params[:post][:start_point]
    @posts.end_point = params[:post][:end_point]
    if @posts.save #保存完了なら
      redirect_to '/post/complete'
    else #完了できなかったら
      redirect_to request.referrer
    end
  end

end

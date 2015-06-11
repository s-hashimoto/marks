class HelloController < ApplicationController
  def index
    @preuser = Preuser.new
    @preusers = Preuser.all
    render :index, layout: "pre"
  end

  def create
    @preuser = Preuser.new
    @preuser.mail = params[:preuser][:mail]
    @preuser.save
    redirect_to '/'
  end

end

class WikisController < ApplicationController
  def index
    @wikis = Wiki.all
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    #@user = User.find(params[:user_id])
    @wiki = Wiki.new
  end

  def create
    @wiki = Wiki.new
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]

    if @wiki.save
      flash[:notice] = "Entry was saved"
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error saving the wiki enttry. Try again"
      render :new
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end

  def update
    @wiki = Wiki.find(params[:id])
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]

    if @wiki.save
      flash[:notice] = "Entry was updated"
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error saving the wiki enttry. Try again"
      render :edit
    end
  end

  def destroy
     @wiki = Wiki.find(params[:id])

     if @wiki.destroy
       flash[:alert] = "\"#{@wiki.title}\" was deleted successfully."
       redirect_to wikis_path
     else
       flash.now[:alert] = "There was an error deleting the post."
       render :show
     end
   end

end

=begin
  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @wiki = Wiki.new
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end

  def create
    @wiki = User.new
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]
    @wiki.price = params[:wiki][:price]
    @user = User.find(params[:user_id])
    @wiki.user = @user
    if @wiki.save
      flash[:notice] = "SponsoredPost was saved."
      redirect_to [@user, @wiki]
    else
      flash.now[:alert] = "There was an error saving the wiki. Please try again"
      render :new
    end #if @post.save
  end

  def update
    @wiki = Wiki.find(params[:id])
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]
    @wiki.price = params[:wiki][:price]
    if @wiki.save
      flash[:notice] = "Wiki was updated."
      redirect_to [@wiki.user, @wiki]
    else
      flash.now[:alert] = "There was an error saving the the wiki. Please try again"
      render :edit
    end #if @sponsored_post.save
  end

  def destroy
    @wiki = Wiki.find(params[:id])
    #
    if @wiki.destroy
      flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
      redirect_to @wiki.user
    else
      flash.now[:alert] = "There was an error deleting the wiki."
      render :show
    end
  end
=end

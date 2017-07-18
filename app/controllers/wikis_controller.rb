class WikisController < ApplicationController

  def index
    @wikis = Wiki.all
    #collaborator feature I'm going to add later
    #@wikis = policy_scope(Wiki)
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
    #temporarily removed
    #@user = current_user
    #@wiki.user = @user
  end

  def create
    @wiki = Wiki.new
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]
    @wiki.access = params[:wiki][:access] #new
    @wiki.private = params[:wiki][:private] #new
    @users = User.all
    #temporarily removed
    #@user = current_user
    #@wiki.user = @user

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
    authorize @wiki
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]
    @wiki.access = params[:wiki][:access]
    @wiki.private = params[:wiki][:private] #new
    @users = User.all

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

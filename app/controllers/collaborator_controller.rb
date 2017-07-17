class CollaboratorController < ApplicationController
=begin
  def new
    @collaborator = @wiki.Collaborator.new
  end

  def show
    @collaborator = Collaborator.find(params[:id])
  end

  def create
    @collaborator = @wiki.Collaborator.new(collaborator_params)

    if @collaborator.save
      flash[:notice] = "Callaboration was saved."
      redirect_to @wiki
    else
      flash[:notice] = "Error. Could not add the collaborator."
      redirect_to @wiki
  end

  def destroy
    @collaborator = Collaborator.find(params[:id])
    if @collaborator.destroy
      flash[:notice] = "#{@collaborator.user.email} was removed."
      redirect_to @wiki
    else
      flash[:notice] = "Error. Could not remove the collaborator."
      redirect_to @wiki
    end
  end

  private
  def get_wiki_id
    @wiki = Wiki.find(params[:wiki_id])
  end

  def get_user_id
    @user = User.find(params[:user_id])
  end
=end
end

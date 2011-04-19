class Members::MembersController < ApplicationController
  before_filter :require_user

  filter_access_to :all

  def index
    render
  end
  
  def edit
    @user=current_user
  end

  def update
    @user=current_user
    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:success] = 'User was successfully updated.'
        format.html { redirect_to admin_user_url(@user) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end
  protected

    def permission_denied
      flash[:error] = "You do not have access to #{request.path}."
      respond_to do |format|
        format.html { redirect_to members_root_url }
        format.xml { head :unauthorized }
        format.js { head :unauthorized }
      end
    end
  
end

class UsersController < ApplicationController
  def show
	@user = User.find(params[:id])
    @view_count_all = @user.company.impressionist_count(:filter=>:all)
    @view_count_sessions = @user.company.impressionist_count(:filter=>:session_hash)
    @view_count_unique = @user.company.impressionist_count(:filter=>:ip_address)
  end
end
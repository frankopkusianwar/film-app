class ProjectsController < ApplicationController
  include ProjectsHelper
  def new
    @project = Project.new
  end

  def create
    @project = Project.new(params.require(:project).permit(:title, :description, :DOP, :videoLength, :artType, :featureImage))
    @project.user_id = current_user.id
    if @project.save
      flash[:notice] = 'Request successful!'
      sgmail('mbabaliiryn@gmail.com', @project[:title])
    else
      @errors = @project.errors.full_messages
      render 'projects/new'
    end
  end
end

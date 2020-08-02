class ProjectsController < ApplicationController
  def new
    @project = Project.new
  end

  def create
    @project = Project.new(params.require(:project).permit(:title, :description, :DOP, :videoLength, :artType, :featureImage))
    if @project.save
      flash[:notice] = 'Request successful!'
      sgmail('okirorfrank3@gmail.com', @project[:title])
    else
      @errors = @project.errors.full_messages
      render 'projects/new'
    end
  end
end
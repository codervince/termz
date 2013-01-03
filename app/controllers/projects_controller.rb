class ProjectsController < ApplicationController

	before_filter :signed_in_user

def new
	@project = current_user.projects.build
	@languages = Language.all(:order => 'iso_code')

end


def show
	#show the project for this user

    # @translations all translations from all projects
	@project = Project.find(params[:id])
	@translations = @project.translations
end


def create
  @project = current_user.projects.build(params[:project])
 
  if @project.save
    flash[:notice] = t(:project_was_created_ok, :default=> "Project was created successfully")
    redirect_to user_projects_path
  else
    render 'new'
  end
end


end

class ProjectsController < ApplicationController

##restrict this page to logged in users who own the projects
before_filter :authenticate_user!

def new
	@project = Project.new
	@languages = Language.all(:order => 'iso_code')

end


def show
	#show the project for this user

    # @translations all translations from all projects
	@project = Project.find(params[:id])
  @projectlang = Language.find_by_id(@project.source_lang_id).iso_code
	# @translations = @project.translations
  #eager? NO!
  @translations = @project.translations.find(:all, :include => [:owner, :source_lang, :target_lang, :domain]) 
  
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


def index
  #display all projects for a particular user
  @projects = current_user.projects


end

end

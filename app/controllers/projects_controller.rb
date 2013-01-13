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
  #eager? NO! all where project_id, user_id current_user
  # @translations = @project.translations.find(:all, :include => [:owner, :source_lang, :target_lang, :domain])
  @translations = Translation.includes(:owner, :source_lang, :target_lang, :domain).where("owner_id = ? and project_id = ?", current_user, @project.id)

  @languages = Language.all(:order => 'iso_code')
  @owner = User.find_by_id(@project.user_id)
  @projectcreatedat = @project.created_at
  @mostpopulartarlang = Language.find_by_id(@project.translations.maximum("source_lang_id"))
end


def create
  @project = current_user.projects.build(params[:project])
  @languages = Language.all(:order => 'iso_code')
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
  #all users translations
  @allusertrans = current_user.translations
  @allusertrans_count = @allusertrans.size
end

end

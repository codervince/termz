class TranslationsController < ApplicationController

def import
  #use carrierwave for more permanent storage e.g. TMX
  #class action (import) in model to handle behavior

  @project = Project.find(params[:project_id])
  
  Translation.set_ids(current_user, @project)

  Translation.import(params[:file])
  @translations = @project.translations
  flash[:notice] = t(:translations_imported, :default => "Translations imported" ) 
  redirect_to user_project_translations_path(@current_user, @project)

end



def index
  #display translations for a project
 @user = current_user
 @project = Project.find(params[:project_id])
 @translations = @project.translations 
 #all translations
 # @translations = Translation.order('created_at desc')

end

def edit

	@translation= Translation.find(params[:id])
end

  def update
    @translation = Translation.find(params[:id])

    respond_to do |format|
      if @translation.update_attributes(params[:translation])
        format.html { redirect_to @translation, notice: 'Translation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @translation.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @translation = Translation.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @translation }
    end
  end

def new

  #from railsrecipes recipe 22
  @user = current_user
  @project = Project.find(params[:project_id])
  @translation = Translation.new

  #get project 
  #if GUEST? all projects where public true
  #get user
  # @project = current_user.projects.build
 
  # @project = current_user.projects.build(params[:project])

  # @translation.owner_id = current_user.id
  # @translation.project_id = Project.find_by_id(params[:project_id]).id

  
  # @translation = Translation.new
  # # @project = Project.find(params[:id])
  # @translations = @project.translations

 # @translation = Translation.new
 @languages = Language.all(:order => 'iso_code')

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @translation }
    end
end


#version 1 - 1 domain per translation
#version 2 - mutliselect to create X translations of same content, one for each domain
def create

 #from railsrecipes recipe 22 - refactor
  # @user = current_user
  @user = current_user
  @project = Project.find(params[:project_id])
  @translation = @project.translations.build(params[:translation])
  @translation.owner_id = @user.id

# @project = Project.find(params[:id])

#  @translation = Translation.new(params[:translation])
#  @translation.owner_id = current_user.id
# @translation.project_id = Project.find_by_id(params[:project_id]).id
  # @user = User.find(params[:user_id])
  # @project = Project.find(params[:project_id])
  # @translation = Translation.new(params[:translation])
  # @project = current_user.projects.build
  # @translation = @project.translations.build
  # @user = current_user
  # @project = Project.find_by_user_id(@user)
  # @translation = @project.translations.build(params[:translation])
  @languages = Language.all(:order => 'iso_code')
  #  #process information from checkbox

  if @translation.save
    flash[:notice] = "Translation was successfully created"
    # redirect_to user_project_translations_path(@user, @project)
    redirect_to root_path
  else
    render 'new'
  end
end

end

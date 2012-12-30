class ProjectsController < ApplicationController




def show 
	@project = Project.find(params[:id])
	@translations = @project.translations
end

end

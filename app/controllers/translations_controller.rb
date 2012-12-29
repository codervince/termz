class TranslationsController < ApplicationController

def import
  #use carrierwave for more permanent storage e.g. TMX
  #class action (import) in model to handle behavior
  Translation.import(params[:file])
  redirect_to translations_path, notice: "Translations imported"

end



def index
 @translations = Translation.order('created_at desc')
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
 @translation = Translation.new
 @languages = Language.all(:order => 'iso_code')
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @translation }
    end
end


#version 1 - 1 domain per translation
#version 2 - mutliselect to create X translations of same content, one for each domain
def create
  @translation = Translation.new(params[:translation])
  #process information from checkbox

  if @translation.save
    flash[:notice] = "Translation was successfully created"
    redirect_to translations_path
  else
    render 'new'
  end
end

end

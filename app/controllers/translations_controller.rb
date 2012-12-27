class TranslationsController < ApplicationController

def index
 @translations = Translation.all
end

def edit

	@translation= Translation.find(params[:id])
end

  def update
    @translation = Translation.find(params[:id])

    respond_to do |format|
      if @translation.update_attributes(params[:translation])
        format.html { redirect_to @translation, notice: 'Product was successfully updated.' }
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

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @translation }
    end
end
end

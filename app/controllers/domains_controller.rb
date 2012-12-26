class DomainsController < ApplicationController

	#no new, create or update

	def index
		@domains = Domain.all
  	end

  	def show
  		@domain = Domain.find(params[:id])
		
  	end

end

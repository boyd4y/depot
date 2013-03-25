class BaseController < ApplicationController
	def pageIndex
		pageindex = params[:page].to_i || 0
	    pagesize = Rails.application.config.default_limit
	    Activity.order("created_at DESC").offset(pageindex * pagesize).limit(pagesize).all
	end
end
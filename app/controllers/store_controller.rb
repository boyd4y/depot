class StoreController < ApplicationController
  def index
  	@activities = Activity.order(:title)
  end
end

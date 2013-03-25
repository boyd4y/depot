class LineItemsController < ApplicationController
  # GET /line_items
  # GET /line_items.json
  def index

    pageindex = params[:page].to_i || 0
    pagesize = Rails.application.config.default_limit

    if params[:user_id]
      @line_items = LineItem.where("user_id = #{params[:user_id]}").order("created_at DESC").offset(pageindex * pagesize).limit(pagesize).all
    else
      @line_items = LineItem.order("created_at DESC").offset(pageindex * pagesize).limit(pagesize).all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @line_items }
    end
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
    @line_item = LineItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @line_item }
    end
  end

  # GET /line_items/new
  # GET /line_items/new.json
  def new
    @line_item = LineItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @line_item }
    end
  end

  # GET /line_items/1/edit
  def edit
    @line_item = LineItem.find(params[:id])
  end

  # POST /line_items
  # POST /line_items.json
  def create
    user = User.find_by_id(params[:line_item][:user_id])
    activity = Activity.find_by_id(params[:line_item][:activity_id])
    @line_item = LineItem.new()

    if user && activity && activity.canbeJoined && !user.joinedActivity(params[:line_item][:activity_id])
      @line_item.activity = activity
      @line_item.user = user

      respond_to do |format|
        if user.credit > activity.point && @line_item.save
          user.removeCredit!(activity.point)
          format.html { redirect_to @line_item, notice: 'Line item was successfully created.' }
          format.json { render json: @line_item, status: :created, location: @line_item }
        else
          format.html { render action: "new" }
          format.json { render json: @line_item.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
            format.html { render action: "new" }
            format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end


  # PUT /line_items/1
  # PUT /line_items/1.json
  def update
    @line_item = LineItem.find(params[:id])

    respond_to do |format|
      if @line_item.update_attributes(params[:line_item])
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy

    respond_to do |format|
      format.html { redirect_to line_items_url }
      format.json { head :no_content }
    end
  end

end

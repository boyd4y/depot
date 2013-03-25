class VariantsController < ApplicationController
  # GET /variants
  # GET /variants.json
  def index
    pageindex = params[:page].to_i || 0
    pagesize = Rails.application.config.default_limit

    if params[:user_id]
      @variants = Variant.where("user_id = #{params[:user_id]}").order("updated_at DESC").offset(pageindex * pagesize).limit(pagesize).all
    else
      @variants = Variant.order("updated_at DESC").offset(pageindex * pagesize).limit(pagesize).all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @variants }
    end
  end

  # GET /variants/1
  # GET /variants/1.json
  def show
    @variant = Variant.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @variant }
    end
  end

  # GET /variants/new
  # GET /variants/new.json
  def new
    @variant = Variant.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @variant }
    end
  end

  # GET /variants/1/edit
  def edit
    @variant = Variant.find(params[:id])
  end

  # POST /variants
  # POST /variants.json
  def create
    @variant = Variant.new(params[:variant])

    respond_to do |format|
      if @variant.save
        format.html { redirect_to @variant, notice: 'Variant was successfully created.' }
        format.json { render json: @variant, status: :created, location: @variant }
      else
        format.html { render action: "new" }
        format.json { render json: @variant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /variants/1
  # PUT /variants/1.json
  def update
    @variant = Variant.find(params[:id])

    respond_to do |format|
      if @variant.update_attributes(params[:variant])
        format.html { redirect_to @variant, notice: 'Variant was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @variant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /variants/1
  # DELETE /variants/1.json
  def destroy
    @variant = Variant.find(params[:id])
    @variant.destroy

    respond_to do |format|
      format.html { redirect_to variants_url }
      format.json { head :no_content }
    end
  end

  # POST /verify.json
  def verify
    @variant = Variant.find_by_fullcode(params[:fullcode])
    @user = User.find_by_id(params[:user_id])
    needAddCredit = @variant && !@variant.checked
    if !@variant || !@user
      respond_to do |format|
        format.html # renders .html.erb
        format.json { render json: {:result => false}, status: :unauthorized}
      end
    elsif @variant.verify!(@user, params[:password])
        # Add credit for the user... 
        @user.addCredit!(@variant.product.point) if needAddCredit
        respond_to do |format|
          format.html # renders .html.erb
          format.json { render json: {:result => true, :credit => @user.credit }, status: :ok}
        end
    else
        respond_to do |format|
          format.html # renders .html.erb
          format.json { render json: {:result => false}, status: :unprocessable_entity}
        end
    end
  end

end

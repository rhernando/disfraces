class DisfrazsController < ApplicationController
  before_filter :authenticate_user!

  # GET /disfrazs
  # GET /disfrazs.json
  def index
    return if !current_user.admin?
    @disfrazs = Disfraz.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @disfrazs }
    end
  end

  # GET /disfrazs/1
  # GET /disfrazs/1.json
  def show
    return if !current_user.admin?
    @disfraz = Disfraz.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @disfraz }
    end
  end

  # GET /disfrazs/new
  # GET /disfrazs/new.json
  def new
    @disfraz = Disfraz.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @disfraz }
    end
  end

  # GET /disfrazs/1/edit
  def edit
    return if !current_user.admin?
    @disfraz = Disfraz.find(params[:id])
  end

  # POST /disfrazs
  # POST /disfrazs.json
  def create
    if !current_user.admin?
      flash.now[:error] = 'No eres administrador'
      return
    end
    @disfraz = Disfraz.new(params[:disfraz])

    respond_to do |format|
      if @disfraz.save
        format.html { redirect_to @disfraz, notice: 'Disfraz was successfully created.' }
        format.json { render json: @disfraz, status: :created, location: @disfraz }
      else
        format.html { render action: "new" }
        format.json { render json: @disfraz.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /disfrazs/1
  # PUT /disfrazs/1.json
  def update
    if !current_user.admin?
      flash.now[:error] = 'No eres administrador'
      return
    end
    @disfraz = Disfraz.find(params[:id])

    respond_to do |format|
      if @disfraz.update_attributes(params[:disfraz])
        format.html { redirect_to @disfraz, notice: 'Disfraz was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @disfraz.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /disfrazs/1
  # DELETE /disfrazs/1.json
  def destroy
    if !current_user.admin?
      flash.now[:error] = 'No eres administrador'
      return
    end
    @disfraz = Disfraz.find(params[:id])
    @disfraz.destroy

    respond_to do |format|
      format.html { redirect_to disfrazs_url }
      format.json { head :ok }
    end
  end
end

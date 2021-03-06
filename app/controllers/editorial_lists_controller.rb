class EditorialListsController < ApplicationController
  load_and_authorize_resource

  # GET /editorial_lists
  # GET /editorial_lists.json
  def index
    @editorial_lists = EditorialList.all
  end

  # GET /editorial_lists/1
  # GET /editorial_lists/1.json
  def show
  end

  # GET /editorial_lists/new
  def new
    @editorial_list = EditorialList.new
  end

  # GET /editorial_lists/1/edit
  def edit
  end

  # POST /editorial_lists
  # POST /editorial_lists.json
  def create
    @editorial_list = EditorialList.new(editorial_list_params)

    respond_to do |format|
      if @editorial_list.save
        format.html { redirect_to @editorial_list, notice: 'Editorial list was successfully created.' }
        format.json { render :show, status: :created, location: @editorial_list }
      else
        format.html { render :new }
        format.json { render json: @editorial_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /editorial_lists/1
  # PATCH/PUT /editorial_lists/1.json
  def update
    respond_to do |format|
      if @editorial_list.update(editorial_list_params)
        format.html { redirect_to @editorial_list, notice: 'Editorial list was successfully updated.' }
        format.json { render :show, status: :ok, location: @editorial_list }
      else
        format.html { render :edit }
        format.json { render json: @editorial_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /editorial_lists/1
  # DELETE /editorial_lists/1.json
  def destroy
    @editorial_list.destroy
    respond_to do |format|
      format.html { redirect_to editorial_lists_url, notice: 'Editorial list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def editorial_list_params
    params.require(:editorial_list).permit(:title, :about, :slug)
  end
end

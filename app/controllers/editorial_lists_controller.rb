class EditorialListsController < ApplicationController
  before_action :set_editorial_list, only: [:add, :show, :edit, :update, :destroy]
  before_action :authorize!

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

  def add
    params.permit(:post_id)
    post = Post.find(params[:post_id])
    @editorial_list.posts << post # TODO - check uniqueness
    flash[:notice] = "Post added to list \"#{@editorial_list.title}\""
    redirect_back(fallback_location: root_path)
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
    # Use callbacks to share common setup or constraints between actions.
    def set_editorial_list
      @editorial_list = EditorialList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def editorial_list_params
      params.require(:editorial_list).permit(:title, :about, :slug)
    end

    def authorize!
      if !current_user || !current_user.admin? || !current_user.role == 'manager'
        flash[:alert] = 'Access restricted'
        redirect_back(fallback_location: root_path)
      end
    end
end

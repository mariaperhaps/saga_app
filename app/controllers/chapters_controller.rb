class ChaptersController < ApplicationController
  before_action :set_chapter, only: [:show, :edit, :update, :destroy]

  # GET /chapters
  # GET /chapters.json
  def index
     user = User.find(session[:user_id])
     @chapters = Chapter.where(saga_id: nil)
     @sagas = Saga.where("user_id = ?", user.id)
     @chapter = Chapter.new
  end

  # GET /chapters/1
  # GET /chapters/1.json
  def show
    if session[:user_id] == nil
      redirect_to login_path
    else
      chapter = params[:id]
      @current_user = Saga.find(Chapter.find(chapter).saga_id).user_id
      @user = User.find(session[:user_id])
      @chapter_id = params[:id]
      @comments = Comment.where(user_id: @user.id, chapter_id: @chapter_id)
    end
  end

  # GET /chapters/new
  def new
    user = User.find(session[:user_id])
    sagas = Saga.where("user_id = ?", user.id)
    @sagas = sagas.select { |saga| saga.title }
    @saga_id = params[:saga_id]
    @chapter = Chapter.new
  end

  # GET /chapters/1/edit
  def edit
    @saga_id = params[:saga_id]
  end

  # POST /chapters
  # POST /chapters.json
  def create
      if params[:chapter][:secret]
       chapter = Chapter.create(chapter_params)
      elsif
        params[:saga] == nil
        flash[:notice] = "You Don't have any Sagas. Create one Now!!!"
      else
      saga = Saga.find_by(title: params[:saga], user_id: session[:user_id])
      chapter = Chapter.create(chapter_params)
      saga_id = saga.id
      chapter.saga_id = saga_id
      chapter.save
    end
    redirect_to user_path(session[:user_id])
  end

  # PATCH/PUT /chapters/1
  # PATCH/PUT /chapters/1.json
  def update
    @chapter.update(chapter_params)
    redirect_to user_path(session[:user_id])
  end

  # DELETE /chapters/1
  # DELETE /chapters/1.json
  def destroy
    @chapter.destroy
    redirect_to user_path(session[:user_id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chapter
      @chapter = Chapter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chapter_params
      params.require(:chapter).permit(:title, :description, :image_url, :scope, :tags, :category, :saga_id)
    end
end

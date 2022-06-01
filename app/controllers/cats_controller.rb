class CatsController < ApplicationController
  before_action :set_cat, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: %i[ index show ]

  # GET /cats or /cats.json
  def index
    @cats = Cat.all
  end

  # GET /cats/1 or /cats/1.json
  def show
  end

  # GET /cats/new
  def new
    @cat = Cat.new(user_id: current_user.id)
  end

  # GET /cats/1/edit
  def edit
    @images_field_disabled = true
  end

  def create
    @cat = Cat.new(cat_params)
    @cat.user_id = current_user.id
    respond_to do |format|
      if @cat.save
        format.html { redirect_to cat_url(@cat), notice: "Cat was successfully created." } 
      else
        format.html { render :new, status: :unprocessable_entity } 
      end
    end
  end

  def update
    respond_to do |format|
      if @cat.update(cat_params)
        format.turbo_stream { redirect_to profile_index_path }
        format.html { redirect_to cat_url(@cat), notice: "Cat was successfully updated." } 
      else
        format.html { render :edit, status: :unprocessable_entity } 
      end
    end
  end

  def destroy
    @cat.destroy

    respond_to do |format|
      format.html { redirect_to cats_url, notice: "Cat was successfully destroyed." } 
    end
  end

  private
    def set_cat
      @cat = Cat.find(params[:id])
    end
 
    def cat_params
      params.require(:cat).permit(:name, :user_id, images: [])
    end
end

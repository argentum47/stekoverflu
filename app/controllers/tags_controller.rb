class TagsController < ApplicationController
  before_action :find_tag, except: [:index, :new, :create]

  def index
    @tags = Tag.order("created_at DESC")
  end

  def show
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to tags_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @tag.update(tag_params)
      redirect_to tags_path
    else
      render :edit
    end
  end

  def destroy
    @tag.destroy
  end

  private

  def tag_params
    params.require(:tag).permit(:name, :description)
  end

  def find_tag
    @tag = Tag.find(params[:id])
  end
end

class ListsController < ApplicationController
  # before_action :set_list, only: %i[show destroy]

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(safe_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @list = List.find(params[:id])
  end

  private

  def safe_params
    params.require(:list).permit(:name)
  end
end

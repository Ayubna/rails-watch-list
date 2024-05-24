class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def new
    @list = List.find(params[:list_id])
  end

  def create
    @list = List.new(restaurant_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :see_other
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end

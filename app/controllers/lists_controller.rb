class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def index
    @lists = List.all
  end

  def new
    @list = List.new
    @list.items.build
    @list.items.build
    @list.items.build
  end

  def create
    @list  = List.new(list_params)
    if @list.save
      redirect_to @list
    else
      flash[:errors] = @list.errors.full_messages
      redirect_to new_list_path
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    @list.list_items.each do |list_item|
      list_item.destroy
    end
    @list.destroy
    redirect_to lists_path
  end

  private

  def list_params
    params.require(:list).permit(:name, item_ids:[], items_attributes: [:name])
  end

  def set_list
    @list = List.find(params[:id])
  end
end

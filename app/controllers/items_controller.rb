class ItemsController < ApplicationController
 before_action :find_item,      only: [:show, :edit, :update, :destroy, :upvote]
 before_action :check_if_admin, only: [:edit, :update, :new, :create, :destroy]

  def index
    @items = Item.all
  end

  def expensive
    @items = Item.where("price > 1000")
    render "index"
  end

  # /items/1 GET
  def show
    #@item = Item.where(id: params[:id]).first
    unless @item
      render plain: "Page not found", status: 404
    end
  end

  # /items/new GET
  def new
    @item = Item.new
  end

  # /items/1/edit GET
  def edit
  end

  # /items POST
  def create
    @item = Item.create(item_params)
    if @item.errors.empty?
      redirect_to item_path(@item)
    else
      render "new"
    end
  end
    #@items = Item.new(item_params) ## Вызывать item_params метод
    #if @items.save
      #redirect_to @items, notice: 'User was successfully created.'
    #else
      #render action: 'new'
    #end

  # /itemd/1 PUT
  def update
    @item.update_attributes(item_params)
    if @item.errors.empty?
      redirect_to item_path(@item)
    else
      render "edit"
    end
  end

  # /items/1 DELETE
  def destroy
    @item.destroy
    redirect_to action: "index"
  end

  def upvote
    @item.increment!(:votes_count )
    redirect_to action: :index
  end

private
# Strong Parameters
  def item_params
    params.require(:item).permit!# (:name, :price, :description, :weight, :password_digest, :password,
                                 #:password_confirmation)
    # params.require(:cart).permit!
    # params.require(:user).permit!
    # params.require(:order).permit!
  end

  def find_item
    @item = Item.where(id: params[:id]).first
    render_404 unless @item
  end

end

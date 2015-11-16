class ItemsController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    @item = @user.items.new(item_params)

    if @item.save
      flash[:notice] = "Item was saved."
    else
      flash[:error] = "There was an error saving the item. Please try again."
    end
    redirect_to user_path(@user)
  end

  def destroy
     @user = User.find(params[:user_id])
     @item = @user.items.find(params[:id])

     if @item.destroy
       flash[:notice] = "Item was deleted."
     else
       flash[:error] = "Item couldn't be deleted. Try again."
     end
     respond_to do |format|
       format.html
       format.js
     end
  end

  private
  def item_params
    params.require(:item).permit(:name)
  end

end

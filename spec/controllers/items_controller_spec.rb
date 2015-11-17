require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  include Devise::TestHelpers

  let(:my_user) { User.create!(email: 'testmember@example.com', password: 'helloworld') }
  let(:my_item) { Item.create!(name: 'Todo Item', user: my_user) }

  before do
    sign_in my_user
  end

  describe "create item" do

    it "flashes notice on success and redirects to user show page" do
      post :create, user_id: my_user.id, item: {name: 'Todo Item'}
      expect(controller).to set_flash[:notice].to(/Item was saved/).now
      expect(response).to redirect_to(user_path(my_user))
    end

    it "flashes alert on failure and redirects to user show page" do
      allow_any_instance_of(Item).to receive(:save).and_return(false)
      post :create, user_id: my_user.id, item: {name: 'Todo Item'}

      expect(controller).to set_flash[:error].to(/There was an error saving the item. Please try again./).now
      expect(response).to redirect_to(user_path(my_user))
    end

    it "list of items includes new item for this user" do
      post :create, user_id: my_user.id, item: {name: 'Todo Item'}
      last_item = Item.last
      user_items = my_user.items
      expect(user_items).to include(last_item)
    end

  end

  describe "destroy item" do

    it "flashes notice on success and redirects to user show page" do
      delete :destroy, format: :js, user_id: my_user.id, id: my_item.id
      expect(controller).to set_flash[:notice].to(/Item was deleted/).now
      expect(response).to have_http_status(:success)
    end

    it "list of items does not include deleted item for this user" do
      deleteItem = my_item.id
      delete :destroy, format: :js, user_id: my_user.id, id: my_item.id
      expect(my_user.items.where(id: deleteItem)).to be_empty
    end

  end

end

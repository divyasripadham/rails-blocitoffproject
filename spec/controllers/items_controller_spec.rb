require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  include Devise::TestHelpers

  let(:my_user) { User.create!(email: 'testmember@example.com', password: 'helloworld') }

  before do
    sign_in my_user
  end
  # let(:my_item) { Item.create!(name: 'Todo Item', user: my_user) }

  describe "create item" do
    # it "increases the number of items by 1" do
    #   expect{ post :create, format: :js, post_id: my_post.id, comment: {body: RandomData.random_sentence} }.to change(Comment,:count).by(1)
    # end

    it "flashes notice on success and redirects to user show page" do
      post :create, user_id: my_user.id, item: {name: 'Todo Item'}
      expect(controller).to set_flash[:notice].to(/Item was saved/).now
      expect(response).to redirect_to(user_path(my_user))
    end

    it "list of items includes new item for this user" do
      post :create, user_id: my_user.id, item: {name: 'Todo Item'}
      last_item = Item.last
      user_items = my_user.items
      expect(user_items).to include(last_item)
    end

  end

end

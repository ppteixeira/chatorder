class Api::ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:get_menu]
  def get_menu
      all_items = Item.all
      @breakfast = Item.where(category: 'breakfast')
      @lunch = Item.where(category: 'lunch')
      @desert = Item.where(category: 'desert')
      @beer = Item.where(category: 'beer')
      @wine = Item.where(category: 'wine')
      @coffee = Item.where(category: 'coffee')
      render json: all_items.to_json
  end

end

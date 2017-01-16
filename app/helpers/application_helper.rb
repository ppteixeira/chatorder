module ApplicationHelper
  def gravatar_for(user, opts = {})
    opts[:alt] = user.name
    image_tag "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}?s=#{opts.delete(:size) { 40 }}",
              opts
  end


  def get_breakfast
    @breakfast = Item.where(category: 'breakfast')
  end

  def get_lunch
    @lunch = Item.where(category: 'lunch')
  end

  def get_desert
    @desert = Item.where(category: 'desert')
  end

  def get_beer
    @beer = Item.where(category: 'beer')
  end

  def get_wine
    @wine = Item.where(category: 'wine')
  end

  def get_coffee
    @coffee = Item.where(category: 'coffee')
  end
end

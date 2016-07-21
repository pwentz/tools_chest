class Category < ActiveRecord::Base
  has_many :tools

  def self.establish(category_params)
    Category.create(
      name: category_params[:name]
    ).tools << category_params[:tools]
  end
end

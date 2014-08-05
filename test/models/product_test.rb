require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  fixtures :products
  test "products is not valid without a unique title" do
  	product=Product.new(
  		:title=>products(:ruby).title,
  		:description=>"yyyy",
  		:price=>1,
  		:image_url=>"fred.jpg"
  	)
  	assert !product.save,"不能重复"
  	# assert_equal "#{product.title}has already been taken",product.errors[:title].join(";")
  end
end

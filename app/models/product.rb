class Product < ActiveRecord::Base
	#字段不为空
	validates :title,:description, :image_url, :presence=>true
	#price为数字且大于等于0.01
	validates :price, :numericality=>{:greater_than_or_equal_to=>0.01}
	#title不重复
	validates :title, :uniqueness=>true
	#img格式验证
	validates :image_url, :format=>{
		:with=>%r{\.(gif|jpg|png)\z}i,
		:message=>'must be a URL for gif,png or jpg image'
	}

end

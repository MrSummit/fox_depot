class Product < ActiveRecord::Base
	#以名称排序来查询
	# default_scope { where(order: 'title') }
	has_many :line_items
	before_destroy :ensure_not_referenced_by_any_line_item
	#字段不为空
	validates :title,:description, :image_url, presence:{message:'不能为空'}
	#price为数字且大于等于0.01
	validates :price, :numericality=>{greater_than_or_equal_to:0.01,message:'价格必须为数字，且大于等于0.01'}
	#title不重复,case_sensitive: false不区分大小写
	validates :title,uniqueness:{message:'title不能重复!',case_sensitive: false}
	#img格式验证
	validates :image_url, :format=>{
		:with=>%r{\.(gif|jpg|png)\z}i,
		:message=>'图片格式必须以:gif,png或者jpg结束'
	}


	private
	def ensure_not_referenced_by_any_line_item
		if line_items.empty?
			return true
		else
			errors.add(:base,'Line Items present')
			return false
		end
	end
end

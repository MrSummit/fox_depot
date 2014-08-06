module ApplicationHelper
	def link(name,action,controller)
		link_to name,:action=>action,:controller=>controller
	end

	def hidden_div_if(condition,attributes={},&block)
		if condition
			attributes["style"]="display:none"
		end
		content_tag('div',attributes,&block)
	end
end

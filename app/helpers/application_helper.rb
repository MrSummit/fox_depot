module ApplicationHelper
	def link(name,action,controller)
		link_to name,:action=>action,:controller=>controller
	end
end

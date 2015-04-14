module ApplicationHelper
	def sort_params(attribute)
		{ sort_by: attribute, order_by: !params.key?(:order_by) && params[:sort_by] == attribute ? 'desc' : nil }
	end
end

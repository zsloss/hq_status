module ApplicationHelper

	def sort_link(body, attribute)
		link_to body, { action: action_name }.merge(sort_params attribute)
	end

	def sort_tasks(tasks, default="flow")
		params[:sort_by] ||= default
		criterion = Proc.new { |t| t.send params[:sort_by] } # attribute to sort by stored in params
		sorted_tasks = tasks.select(&criterion).sort_by(&criterion)
		nil_attr_tasks = tasks.reject(&criterion)
		tasks = sorted_tasks + nil_attr_tasks # nil attributes at the end
		tasks.reverse! if params[:order_by] == 'desc'
		return tasks
	end

	def days_ago(date)
		days = days_since date
		"#{days} #{'day'.pluralize(days)} ago"
	end

	private

	def sort_params(attribute)
		{ sort_by: attribute, order_by: !params.key?(:order_by) && params[:sort_by] == attribute ? 'desc' : nil }
	end

	def days_since(date)
		(Date.today - date).to_i
	end
	
end

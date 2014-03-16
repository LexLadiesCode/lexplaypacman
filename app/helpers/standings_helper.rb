module StandingsHelper
	def sortable(column, title = nil)
		title ||= column.titleize
		direction = ((column == params[:sort]) && (params[:direction] == "asc")) ? "desc" : "asc"
		arrow = direction == "asc" ? "glyphicon glyphicon-chevron-up" : "glyphicon glyphicon-chevron-down"
		link_to title, {:sort => column, :direction => direction}, {:class => arrow}		
	end
end

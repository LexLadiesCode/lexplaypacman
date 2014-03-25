module StandingsHelper
	def sortable(column, title = nil)
		title ||= column.titleize
		if column == params[:sort] && params[:direction] == 'asc'
			direction = 'desc'
		else
			direction = 'asc'
		end
		# direction = ((column == params[:sort]) && (params[:direction] == "asc")) ? "desc" : "asc"
		if direction == "asc"
			arrow = "glyphicon glyphicon-chevron-up"
		else
			arrow = "glyphicon glyphicon-chevron-down"
		end
		# arrow = direction == "asc" ? "glyphicon glyphicon-chevron-up" : "glyphicon glyphicon-chevron-down"
		link_to title, {:sort => column, :direction => direction, :time => params[:time]}, {:class => arrow}
	end

	def time(column, time)
		if time_ago_in_words(time) == time_ago_in_words(sort_time)
			active = 'strong'
		else
			active = 'weak'
		end

		link_to column, {:sort => params[:sort], :direction => params[:direction], :time => time}, {:class => active}
	end
end
module StoriesHelper
	def yuml_img(story)
		title = story.title
		"<img src='http://yuml.me/diagram/plain/usecase/[#{story.role.name}]-(#{title})' />".html_safe
	end

	def yuml_functions(stories)
		urlArg = ""
		stories.each do |story|
			urlArg << "[#{story.role.name}]-(#{story.title}),"
		end
		# urlArg << "[#{lastStory.role}]-(#{lastStory.title})"
		"<img src='http://yuml.me/diagram/plain/usecase/#{urlArg}' />".html_safe
	end
	def steps_of(story)
		"/stories/steps/#{story.id}"
	end
end
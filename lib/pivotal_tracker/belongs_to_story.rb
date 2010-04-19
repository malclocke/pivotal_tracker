module PivotalTracker
  module BelongsToStory
    def story
      self.project.story(self.prefix_options[:story_id])
    end

    def story=(story)
      self.prefix_options[:story_id] = story.id
      self.prefix_options[:project_id] = story.prefix_options[:project_id]
    end
  end
end

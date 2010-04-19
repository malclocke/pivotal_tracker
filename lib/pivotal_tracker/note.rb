module PivotalTracker
  class Note < Resource

    include PivotalTracker::BelongsToProject
    include PivotalTracker::BelongsToStory

    self.site = SITE_BASE + 'projects/:project_id/stories/:story_id'

  end
end

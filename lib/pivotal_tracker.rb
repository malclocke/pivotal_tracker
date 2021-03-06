require 'active_resource'

require 'pivotal_tracker/story_collection'
require 'pivotal_tracker/belongs_to_project'
require 'pivotal_tracker/belongs_to_story'
require 'pivotal_tracker/resource'
require 'pivotal_tracker/client'
require 'pivotal_tracker/project'
require 'pivotal_tracker/iteration'
require 'pivotal_tracker/story'
require 'pivotal_tracker/task'
require 'pivotal_tracker/note'
require 'pivotal_tracker/attachment'

def PivotalTracker(options = {})
  PivotalTracker::Client.new(options)
end

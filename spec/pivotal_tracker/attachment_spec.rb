require 'spec_helper'

describe PivotalTracker::Attachment do
  before do
    @pivotal = PivotalTracker(:token => 'foo')
    @project = PivotalTracker::Project.new(:id => 1)
    @story = PivotalTracker::Story.new(:id => 1)
    @story.project = @project
    @attachment = PivotalTracker::Attachment.new(:id => 1)
    @attachment.story = @story
    @headers = {'Accept' => 'application/xml', 'X-TrackerToken' => 'foo'}
    ActiveResource::HttpMock.respond_to do |mock|
      mock.get "/services/v3/projects/1.xml", @headers,
        fixture('project.xml')
      mock.get "/services/v3/projects/1/stories/1.xml", @headers,
        fixture('story.xml')
    end
  end

  it "should get the project" do
    @attachment.project.should be_kind_of(PivotalTracker::Project)
    @attachment.project.id.to_i.should == @project.id
  end

  it "should get the story" do
    @attachment.story.should be_kind_of(PivotalTracker::Story)
  end

  it "should set the story" do
    @story.id = 2
    @attachment.story = @story
    @attachment.prefix_options[:story_id].should == 2
  end
end

# frozen_string_literal: true

require "rails_helper"

RSpec.describe ExternalVideoImport::MetadataProcessing::VideoCreator do
  describe ".create_video" do
    let(:attributes) do
      {
        title: "Test Video",
        duration: 120,
        youtube_id: "abc123",
        description: "This is a test video"
      }
    end

    it "creates a video with the provided attributes" do
      expect(::Video).to receive(:create!).with(attributes)
      described_class.create_video(attributes)
    end
  end
end

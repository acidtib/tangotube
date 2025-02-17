# frozen_string_literal: true

class Activity < ApplicationRecord
  belongs_to :user
  belongs_to :object, polymorphic: true
end

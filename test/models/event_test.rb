# == Schema Information
#
# Table name: events
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  city       :string
#  country    :string
#  date       :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "test_helper"

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

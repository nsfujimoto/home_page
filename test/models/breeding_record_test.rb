# == Schema Information
#
# Table name: breeding_records
#
#  id         :integer          not null, primary key
#  feed       :string
#  weight     :integer
#  height     :integer
#  is_shed    :boolean
#  note       :text
#  photo_url  :string
#  date       :date             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class BreedingRecordTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

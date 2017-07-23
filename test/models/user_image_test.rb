# == Schema Information
#
# Table name: user_images
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  image      :binary
#  file_type  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class UserImageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

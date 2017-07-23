# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  data       :binary           not null
#  file_type  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#

require 'test_helper'

class PhotoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

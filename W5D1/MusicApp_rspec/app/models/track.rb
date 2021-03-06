# == Schema Information
#
# Table name: tracks
#
#  id          :bigint(8)        not null, primary key
#  album_id    :integer          not null
#  title       :string           not null
#  ord         :integer          not null
#  lyrics      :text
#  bonus_track :boolean          default(FALSE), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Track < ApplicationRecord
  validates :title, :ord, presence: true
  validates :bonus_track, inclusion: {in: [true,false]}

  belongs_to :album

end

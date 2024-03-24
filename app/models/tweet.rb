# == Schema Information
#
# Table name: tweets
#
#  id              :bigint           not null, primary key
#  content         :text             not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  parent_tweet_id :integer
#  user_id         :bigint           not null
#
# Indexes
#
#  index_tweets_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Tweet < ApplicationRecord
  paginates_per 5

  belongs_to :user, optional: true
  has_many :replies, class_name: "Tweet", foreign_key: "parent_tweet_id"
  has_many :likes, dependent: :destroy

  validates :content, presence: true

  scope :search, -> (keyword) { where("content LIKE ?", "%#{keyword}%") }

  def liked_by?(user)
    likes.exists?(user: user)
  end
end

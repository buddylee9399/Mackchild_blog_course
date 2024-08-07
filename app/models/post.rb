# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  content    :text
#  slug       :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_posts_on_slug  (slug) UNIQUE
#
class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
end

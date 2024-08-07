# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  description :text
#  link        :string
#  slug        :string
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_projects_on_slug  (slug) UNIQUE
#
class Project < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
end

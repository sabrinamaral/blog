class BlogPost < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :body, presence: true

  before_save :set_category

  def reading_time
    (body.split.size / 250.0).ceil
  end

  private

  def set_category
    if body.match?(/rails|activerecord/i)
      self.category = "rails"
    elsif body.match?(/javascript|react|js/i)
      self.category = "javascript"
    else
      self.category = "general"
    end
  end
end

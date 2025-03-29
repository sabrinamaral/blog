class BlogPost < ApplicationRecord
  has_rich_text :body

  validates :title, presence: true, uniqueness: true
  validates :body, presence: true

  before_save :set_category, unless: :category_changed?

  def reading_time
    ((body.to_plain_text).split.size / 250.0).ceil
  end

  private

  def set_category
    if (body.to_plain_text).match?(/rails|activerecord/i)
      self.category = "rails"
    elsif (body.to_plain_text).match?(/javascript|react|js/i)
      self.category = "javascript"
    else
      self.category = "general"
    end
  end

  def category_changed?
    will_save_change_to_category?
  end
end

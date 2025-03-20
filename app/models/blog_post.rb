class BlogPost < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true

  def reading_time
    (body.split.size / 250.0).ceil
  end
end

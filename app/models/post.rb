class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in:["Fiction," "Non-Fiction"] }
    validate :title_contains_believe
end

def title_contains_believe
  catch_phrases = ["Top [number]", "Won't Believe", "Secret", "Guess"]

  unless catch_phrases.any? { |phrase| title.include?(phrase) }
    errors.add(:title, "should be sufficiently clickbait-y")
  end
end

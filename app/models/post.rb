class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validates :clickbait, inclusion: {in: [true] }

  def clickbait
    if !title.nil?
     ["Won't Believe", "Secret", "Top", "Guess"].any? { |phrase| title.include? phrase } 
    end
  end

end

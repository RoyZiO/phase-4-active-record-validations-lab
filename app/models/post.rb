class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :disallow_title

    #Custom validation
    def disallow_title
        if title == "True Facts"
            errors.add(:title, "title already in use")
        end
    end
    
end


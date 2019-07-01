class Song < ApplicationRecord
    validates :title, presence: true, uniqueness: true
    validates :artist_name, presence: true
    validate :valid_release_year?

    def valid_release_year?
        if released
            year = self.release_year.to_i

            if year.zero?
                errors.add(:release_year, 'Release year cannot be 0')
            elsif year >= Time.new.year
                errors.add(:release_year, 'Release year must be in the past')
            end
        else
            true
        end
    end

end

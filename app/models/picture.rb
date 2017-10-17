class Picture < ApplicationRecord

  validates   :artist,     presence: true
  validates   :title,      presence: true
  validates   :url,        presence: true


    def self.pictures_created_in_year(year)
      start_date = DateTime.new(year,1,1)
      end_date = DateTime.new(year,12,31)
      Picture.where("created_at > ?", start_date).where("created_at < ?", end_date)
    end

    def self.newest_first
      Picture.order("created_at DESC")
    end

    def self.most_recent_five
      Picture.newest_first.limit(5)
    end

    def self.most_popular_pictures
      Picture.newest_first.limit(1)
    end

    def self.created_before(time)
      Picture.where("created_at < ?", time)
    end


end

class ArchiveAds
  def self.archive_ads
    Ad.all.each do |ad|

      if ad.status == "published"
        ad.status = "archived" if DateTime.now - ad.published_at.to_datetime >= 3
        ad.update(:status => "archived", :published_at => nil)
      end
    end
  end
end

require_relative '../../lib/scrapers/wolt_scraper'

namespace :scrapers do
  desc "Run the restaurant scraper"
  task scrape_restaurants: :environment do
    puts "Starting the Wolt restaurant scraper..."
    scraper = WoltScraper.new
    url_array = scraper.get_urls
    url_array.each do |url|
       scraper.get_restaurant_data(url)
    end
    puts "Scraper is done."
  end
end

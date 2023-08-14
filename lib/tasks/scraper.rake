namespace :scraper do
  desc "Run the restaurant scraper"
  task scrape_restaurants: :environment do
    puts "Starting the restaurant scraper..."
    scraper = WoltScraper.new
    url_array = scraper.generate_urls 
    url_array.each do |url|
       scraper.get_restaurant_data(url)
    end
    puts "Scraper is done."
  end
end

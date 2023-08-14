require 'watir'

class WoltScraper

    def initialize
        Watir.default_timeout = 5 # default is 30sec
        @browser = Watir::Browser.new :chrome, headless: true # Open a new browser
    end   

    def get_urls
        @browser.goto('https://wolt.com/en/deu/cologne/category/healthy') # only healthy restaurants in Cologne

        links = []
        as = @browser.as(class: /^sc-5f738603-0$/)

        as.each do |link|
            links << link.href
        end

        links
    end

    # Map attributes to databases
    def get_restaurant_data(url) 
        restaurant_name = restaurant_name()
        restaurant_rating = restaurant_rating()
        restaurant_opening_times = restaurant_opening_times()
        restaurant_menu = restaurant_menu()
      
        ActiveRecord::Base.transaction do
          restaurant = Restaurant.create!(
            name: restaurant_name,
            rating: restaurant_rating,
            monday_open: restaurant_opening_times["monday_opening_time"],
            monday_close: restaurant_opening_times["monday_closing_time"],
            tuesday_open: restaurant_opening_times["tuesday_opening_time"],
            tuesday_close: restaurant_opening_times["tuesday_closing_time"],
            wednesday_open: restaurant_opening_times["wednesday_opening_time"],
            wednesday_close: restaurant_opening_times["wednesday_closing_time"],
            thursday_open: restaurant_opening_times["thursday_opening_time"],
            thursday_close: restaurant_opening_times["thursday_closing_time"],
            friday_open: restaurant_opening_times["friday_opening_time"],
            friday_close: restaurant_opening_times["friday_closing_time"],
            saturday_open: restaurant_opening_times["saturday_opening_time"],
            saturday_close: restaurant_opening_times["saturday_closing_time"],
            sunday_open: restaurant_opening_times["sunday_opening_time"],
            sunday_close: restaurant_opening_times["sunday_closing_time"],
            url: url
          )
      
          restaurant_menu.each do |title, menu_item|
            restaurant.dishes.create!(
              name: title,
              price: menu_item[:price],
              ingredients: menu_item[:ingredients],
              url: url
            )
          end
        end
      rescue => e
        puts "Failed to save Restaurant or Dish: #{e.message}"
    end
      
    # Individual Attribute Scraping Functions

    def restaurant_name
        @browser.span(class: /^sc-5a592413-5$/).text
    end

    def restaurant_rating
        if @browser.span(class: /^sc-228efb61-2$/).exist?
            @browser.span(class: /^sc-228efb61-2$/).text
        else
            "no rating"
        end
    end

    def restaurant_opening_times
        opening_times = {}
    
        @browser.trs(class: /^sc-b546f77a-4$/).each do |tr|
            day = tr.tds[0].text.downcase # to make it lower case to match the DB fields
            time = tr.tds[1].text.split(' - ')  # Split at ' - ' and put in two separate values
            opening_time = time[0]
            closing_time = time[1]
    
            opening_times["#{day}_opening_time"] = opening_time
            opening_times["#{day}_closing_time"] = closing_time
        end
    
        opening_times
    end
    

    def restaurant_menu
        menu = {}
      
        @browser.divs(class: /^sc-c89e7f2c-3$/).each do |div|
          title = div.h3(class: /^sc-866b5984-2$/).text

          menu_item = {
            ingredients: div.p(class: /^sc-866b5984-0$/).text, # ingredients
            price: div.p(class: /^sc-997c7117-1$/).text # price
          }

          menu[title] = menu_item
        end
      
        menu
    end
end

    # IMPROVEMENT IDEAS
    # TODO: Add allergens (click on product, then product info)

require 'net/http'
require 'uri'
require 'JSON'
require_relative '../.api_key.rb'

def getNYCToiletData
  uri = URI.parse("https://data.cityofnewyork.us/resource/hjae-yuav.json")
  response = Net::HTTP.get_response uri
  JSON.parse(response.body)
end

def createToilets
  json = getNYCToiletData()
  json.each do |toilet|
    nameQuery = toilet["name"].gsub(" ", "%20").gsub("é", "e")
    boroughQuery = toilet["borough"]
    if nameQuery == "West%202nd%20Street%20Comfort%20Station"
      nameQuery = "2-424 Riegelmann Boardwalk, Brooklyn, NY 11224".gsub(" ", "%20")
    end
    uri = URI.parse("https://maps.googleapis.com/maps/api/geocode/json?address=#{nameQuery}%20#{boroughQuery}%20NY&key=#{GOOGLE_MAP_KEY}")
    response = Net::HTTP.get_response uri
    results = JSON.parse(response.body)
    
    if results["status"] != "ZERO_RESULTS"
      hood = results["results"][0]["address_components"].select { |component| component if component["types"].include?("neighborhood")}
      hood = hood.empty? ? "No Neighborhood" : hood[0]["long_name"]
      handicap = toilet["handicap_accessible"] ? true : false
      openYrRound = toilet["open_year_round"] == "Yes" ? true : false
      
      Toilet.create(
        name:toilet["name"],
        location:toilet["location"],
        handicap_accessible: handicap,
        open_year_round: openYrRound,
        borough: toilet["borough"],
        latitude: results["results"][0]["geometry"]["location"]["lat"],
        longitude: results["results"][0]["geometry"]["location"]["lng"],
        address: results["results"][0]["formatted_address"],
        neighborhood: hood,
        likes: rand(1..50)
      )
    else
      next
    end
  end
end

createToilets()

4000.times do 
  Review.create(toilet:Toilet.all.sample, content:Faker::Restaurant.review, name: Faker::Name.name, rating:rand(1..5), date:Faker::Date.between(from: '2018-01-01', to: '2020-11-08'), image:"https://www.atlantawatershed.org/wp-content/uploads/2017/06/default-placeholder.png")
end
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
  images = [
    "https://healthnewshub.org/wp-content/uploads/2020/05/Newspublicrestroom.jpg",
    "https://images.theconversation.com/files/340074/original/file-20200605-176575-1vkew9v.jpg?ixlib=rb-1.1.0&rect=11%2C27%2C2570%2C1687&q=45&auto=format&w=496&fit=clip",
    "https://www.gannett-cdn.com/presto/2019/01/28/PPHX/1c95ae4d-fa6e-428a-99e5-75fd8ae6f957-bathroom.jpg",
    "https://i.cbc.ca/1.5317103.1570742426!/fileImage/httpImage/image.jpg_gen/derivatives/16x9_940/shutterstock-medium-file.jpg",
    "https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F200619190852-public-restroom-coronavirus.jpg",
    "https://static01.nyt.com/images/2020/06/16/science/16VIRUS-FLUSH/16VIRUS-FLUSH-videoSixteenByNineJumbo1600.jpg",
    "https://static.theprint.in/wp-content/uploads/2020/06/Public-toilet-scaled-e1591943394811.jpg",
    "https://media.11alive.com/assets/WXIA/images/44e3aca8-ae3e-42a2-9058-3731610a0e9f/44e3aca8-ae3e-42a2-9058-3731610a0e9f_1920x1080.jpg",
    "https://thumbor.forbes.com/thumbor/711x474/https://specials-images.forbesimg.com/imageserve/508182318/960x0.jpg?fit=scale",
    "https://i.guim.co.uk/img/media/f9b7441b1788be787f8d34eb871ea04657554692/0_178_3808_2284/master/3808.jpg?width=700&quality=85&auto=format&fit=max&s=a30171f0a37955d8348a0ac9c668bfb5",
    "https://ggwash.org/images/posts/_resized/bathroom.jpg",
    "https://images.theconversation.com/files/101881/original/image-20151113-10438-1pi0mqn.jpg?ixlib=rb-1.1.0&rect=86%2C298%2C1518%2C739&q=45&auto=format&w=1356&h=668&fit=crop",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRdwzWYHcXdft6D11cgtQ48Bbo6PBZ9UJKzBg&usqp=CAU",
    "https://assets.tvo.org/prod/s3fs-public/styles/mobile/public/media-library/publictoilet.jpg?ttC6vpxDtwVuT0mFqADftSBvv7V8gLOv&itok=vz-29CWd",
    "https://npr.brightspotcdn.com/dims4/default/10f15c5/2147483647/strip/true/crop/4032x3024+0+0/resize/880x660!/quality/90/?url=http%3A%2F%2Fnpr-brightspot.s3.amazonaws.com%2Flegacy%2Fsites%2Fwlrn%2Ffiles%2F201809%2Fpublic_bathroom_0.jpg",
    "https://www.tripsavvy.com/thmb/JkKlbaeaZ41F_5t9m3J1QbdiQcs=/1423x1067/smart/filters:no_upscale()/NYC-public-restroom-5967b7945f9b5816183ac1a3.jpg",
    "https://www.amny.com/wp-content/uploads/2018/02/image-44.jpeg",
    "https://static01.nyt.com/images/2014/03/12/nyregion/CITYROOM/CITYROOM-tmagArticle.jpg",
    "https://newyork.cbslocal.com/wp-content/uploads/sites/14578484/2018/05/what_s-the-hold-up-installing-public-restrooms.jpg?w=1280",
    "https://toilet-guru.com/pictures/subway-20130921_154759.jpg",
    "https://www.nydailynews.com/resizer/cicO2EeksxMqfAv4mjZom2-Sqj8=/fit-in/800x533/smart/filters:fill(black)/arc-anglerfish-arc2-prod-tronc.s3.amazonaws.com/public/CZ6T6BECZEAQZMWPSV66VLSTWQ.jpg",
    "https://reichcomm.typepad.com/.a/6a00d83451bafe69e201348871a41b970c-pi",
    "https://i.pinimg.com/originals/97/bf/42/97bf420f7ccd8a97ea33932dd437adc9.jpg",
    "https://i.pinimg.com/originals/1d/38/51/1d38518545fee5e3537cc05e0c2aefd9.jpg",
    "https://toilography.files.wordpress.com/2015/07/welcome-to-the-johnsons.jpg",
    "https://i.pinimg.com/originals/17/7a/e0/177ae02a9162442651d11997abcd37b2.jpg",
    "https://assets.bwbx.io/images/users/iqjWHBFdfxIU/if7qy.wf1RgU/v0/1200x743.jpg",
    "https://www.liveabout.com/thmb/T3WMNtfQyggElMNpLUs2IqIYXuk=/3264x1836/smart/filters:no_upscale()/dueling-poops-59a4259f68e1a200134ae5a8.jpg",
    "https://ca-times.brightspotcdn.com/dims4/default/175a594/2147483647/strip/true/crop/1024x538+0+108/resize/1200x630!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2Fe0%2F71%2F8f94080a964bc6da4c44cdc14bed%2Fla-xpm-photo-2014-feb-06-la-sh-sochi-strange-toilets-20140206",
    "https://clarissasblogdotcom.files.wordpress.com/2014/01/russian-toilets.png?w=640",
    "https://boredombash.com/wp-content/uploads/2014/08/Strange-Bathrooms-8.jpg",
    "https://images.boredomfiles.com/wp-content/uploads/bolt/2019/09/bathroom_09042019_2027-731w.jpg",
    "https://i.pinimg.com/originals/d1/2b/b0/d12bb03780a11e1aa0dd9c89b6612c8a.jpg",
    "https://www.liveabout.com/thmb/Bs7zJLn65P2fvmxfnVsHSz9BesM=/1200x800/filters:no_upscale():max_bytes(150000):strip_icc()/bad-public-toilet-59a420ab845b3400113afc2b.png",
    "https://cdn.cheapism.com/images/072516_best_restrooms_around_the_world_slide.max-420x243_xtkFguH.jpg",
    "https://i.redd.it/v899cgs88v721.jpg",
    "https://cdn.icepop.com/wp-content/uploads/2019/09/17-Public-toilets-bathrooms-around-the-world-Reddit-zazracnedieta.jpg"
  
  ]
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
        likes: rand(1..50),
        image: images.sample
      )
    else
      next
    end
  end
end




createToilets()

2000.times do 
  Review.create(toilet:Toilet.all.sample, content:Faker::Restaurant.review, name: Faker::Name.name, rating:rand(1..5), date:Faker::Date.between(from: '2018-01-01', to: '2020-11-08'))
end
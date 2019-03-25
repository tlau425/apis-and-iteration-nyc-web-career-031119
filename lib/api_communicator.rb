require 'rest-client'
require 'json'
require 'pry'

response = RestClient.get('https://www.swapi.co/api/people/?format=json')
data = JSON.parse(response.body)

def get_character_movies_from_api(character_name)
  #make the web request
  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  response = RestClient.get('https://www.swapi.co/api/people/?format=json')
  data = JSON.parse(response.body)

  data["results"].find do |result|
    result["name"] == character_name
  end["films"]

end

  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.

def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
  # response = RestClient.get('https://swapi.co/api/films/?format=json')
  # data = JSON.parse(response.body)

  films.map do |movie|
    puts JSON.parse(RestClient.get("#{movie}?format=json"))["title"]
  end

end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?

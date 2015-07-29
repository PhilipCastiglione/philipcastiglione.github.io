require 'uri'
include CopyLib
include ImdbPoster

class MoviesController < ApplicationController

  def index
    @themes = getNouns.keys
  end

  def omdb_search
    url = "http://www.omdbapi.com/?s=#{params[:search]}"
    movies_data = HTTParty.get(URI.escape(url))
    render :json => movies_data.to_json
  end

  def omdb_title
    cleaned_title = params[:title].gsub("'","&#39;")
    movie = Movie.where(:title => cleaned_title)
    if movie.empty?

      url = "http://www.omdbapi.com/?t=#{params[:title]}"
      @omdb_data = HTTParty.get(URI.escape(url))

      new_movie = Movie.new
      
      new_movie.title = cleaned_title
      new_movie.theme = params[:theme]
      new_movie.imdb = "http://www.imdb.com/title/#{@omdb_data['imdbID']}"
      new_movie.poster = @omdb_data["Poster"]
      
      if @omdb_data["Poster"] == "N/A"
        render :json => "No poster".to_json and return
      end

      unless @omdb_data["Response"] != "False" && new_movie.save
        # throw error
        puts 'error in movies#title when attempting to save'
      end

      movie = Movie.where(:title => cleaned_title)
      render :json => movie.to_json and return
    end
    render :json => "Already have it".to_json
  end

  def omdb_to_imdb
    movies = Movie.all
    movies.each do |movie|
      movie.poster = getImdbPoster(movie.imdb)
      movie.save
    end
    render :json => "converted to imdb".to_json
  end

end
require 'spec_helper'

describe MoviesController do
  describe 'searching movies of same director' do
  	it 'should call the model method that retrieves movies by certain director' do
  		fake_movie = double('Movie', :director => 'Cameron')
  		fake_movies = [mock('Movie'), mock('Movie')]
  		Movie.should_receive(:find).with(1).and_return(fake_movie)
  		Movie.should_receive(:find_similar).with(fake_movie.director).and_return(fake_movies)
  		post :same_director, { :id => 1 }
  	end
  	it 'should select the similar movies template for rendering' do
  		fake_movie = double('Movie', :director => 'Cameron')
  		fake_movies = [mock('Movie'), mock('Movie')]
  		Movie.should_receive(:find).with(1).and_return(fake_movie)
  		Movie.should_receive(:find_similar).with(fake_movie.director).and_return(fake_movies)
  		post :same_director, { :id => 1 }
  		response.should render_template('same_director')
  	end
  	it 'should make the similar movies results available to that template' do
  		fake_movie = double('Movie', :director => 'Cameron')
  		fake_movies = [mock('Movie'), mock('Movie')]
  		Movie.should_receive(:find).with(1).and_return(fake_movie)
  		Movie.should_receive(:find_similar).with(fake_movie.director).and_return(fake_movies)
  		post :same_director, { :id => 1 }
  		assigns(:movies).should == fake_movies
  	end
  end
end
require 'spec_helper'

describe Movie do
  describe 'searching similar movies by director' do
  	context 'with existent director' do
  		it 'should return movies array' do
  			fake_movies = [mock(Movie), mock(Movie)]
  			Movie.stub(:find_similar).with('Cameron').and_return(fake_movies)
  			Movie.find_similar('Cameron').should == fake_movies
  		end
  	end
  	context 'with no director' do
  		it 'should return empty array' do
  			Movie.find_similar(nil).should be_empty
  		end
  	end
  end
end
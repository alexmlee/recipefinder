class Recipe < ActiveRecord::Base
	include HTTParty
	key = ENV['FOOD2FORK_KEY']
	hostport = ENV['FOOD2FORK_SERVER_AND_PORT'] || 'www.food2fork.com'


	base_uri "http://#{hostport}/api/search"
	default_params key: key
	format :json

	def self.for keyword
		get('/search', query: { q: keyword})["recipes"]
	end
end

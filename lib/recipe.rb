ENV['RACK_ENV'] = 'test'
require('pg')
DB = PG.connect({:dbname => "recipe_box_development"})

class Recipe < ActiveRecord::Base
  has_and_belongs_to_many(:ingredients)
  has_and_belongs_to_many(:tags)
end

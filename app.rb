require('bundler/setup')
require('pry')
   Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
#add also reload

get ("/") do
  @tags=Tag.all()
  erb(:index)
end

post ('/tags') do
  name=params.fetch("name")
  Tag.create(:name => name)
  redirect('/')
end

delete ('/tags') do
    tag=Tag.find(params.fetch('id').to_i)
    tag.delete
    redirect("/")
end

get ('/tags/:id') do
  @tag=Tag.find(params.fetch('id').to_i)
  @recipes=@tag.recipes
  erb(:tag)
end

post ('/recipes') do
  name=params.fetch("name")
  self_id=params.fetch('self_id')
  tag=Tag.find(params.fetch('self_id'))
  recipe = Recipe.create(:name => name)
  recipe.tags << tag     #<< means array appending character , ActiveRecord use this to update relation join table
  redirect("/tags/#{self_id}")
end

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
    redirect("/")
  end

  delete ('/tags') do
    tag=Tag.find(params.fetch('id').to_i)
    tag.delete
    redirect("/")
  end



get ('/tags/:id') do
  DB.exec("select * from recipes order by rate");
  @tag=Tag.find(params.fetch('id').to_i)
  @recipes=@tag.recipes.order("rate desc")
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

  delete ('/recipes') do
    recipe=Recipe.find(params.fetch('id').to_i)
    recipe.delete
    self_id=params.fetch('self_id')
    redirect("/tags/#{self_id}")
  end

  patch ('/recipes') do
    recipe=Recipe.find(params.fetch('id').to_i)
    self_id=params.fetch('self_id')
    rate=params.fetch('rate')
    recipe.update({:rate => rate})
    redirect("/tags/#{self_id}")
  end

get ('/tags/:id/recipes/:id2') do
  @tag=Tag.find(params.fetch('id').to_i)
  @recipe=Recipe.find(params.fetch('id2').to_i)
  @ingredients=@recipe.ingredients
  erb(:ingredients)
end

  post ('/ingredients') do
    tag_id = params.fetch('tag_id').to_i
    recipe_id = params.fetch('recipe_id').to_i
    name=params.fetch("name")
    ingredient = Ingredient.create(:name => name)
    recipe = Recipe.find(recipe_id)
    ingredient.recipes << recipe     #<< means array appending character , ActiveRecord use this to update relation join table
    redirect("/tags/#{tag_id}/recipes/#{recipe_id}")
  end

  delete ('/ingredients') do
    tag_id = params.fetch('tag_id').to_i
    recipe_id = params.fetch('recipe_id').to_i
    ingredient= Ingredient.find(params.fetch('id'))
    ingredient.delete
    redirect("/tags/#{tag_id}/recipes/#{recipe_id}")
  end

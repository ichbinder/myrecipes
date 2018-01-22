require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  def setup
    @recipe = Recipe.new(
      name: 'vegetable',
      description: 'great vegetable recipe'
    )
  end

  test 'recipe shuld be valid' do
    assert @recipe.valid?
  end

  test 'name shuld be present' do
    @recipe.name = ' '
    assert_not @recipe.valid?
  end

  test 'description shuld be present' do
    @recipe.description = ' '
    assert_not @recipe.valid?
  end

  test "description should't be  less than 5 characters" do
    @recipe.description = 'a' * 3
    assert_not @recipe.valid?
  end

  test "description should't be  less than 500 characters" do
    @recipe.description = 'a' * 501
    assert_not @recipe.valid?
  end
end

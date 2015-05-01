require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application

describe('the path to submit a word', {:type => :feature}) do
  it('processes the user entry and saves it as a word in the dictionary') do
    visit('/words/new')
    fill_in('name', :with => 'elephant')
    click_button('Add Word')
    expect(page).to have_content('Success')
  end
end

describe('the path to add a definition', {:type => :feature}) do
  it('allows the user to add a definition to submitted word') do
    visit('/words/new')
    fill_in('name', :with => 'elephant')
    click_button('Add Word')
    visit('words/1/definitions/new')
    fill_in('definition', :with => 'spirit animal')
    click_button('Add Definition')
    expect(page).to have_content('Success')
  end
end

describe('the path to see an added definition', {:type => :feature}) do
  it('see the definition of a word') do
    visit('/words/new')
    fill_in('name', :with => 'elephant')
    click_button('Add Word')
    visit('words/1/definitions/new')
    fill_in('definition', :with => 'spirit animal')
    click_button('Add Definition')
    visit('words/1')
    expect(page).to have_content('spirit animal')
  end
end

describe('the path to add an additional definition', {:type => :feature}) do
  it('see the definition of a word') do
    visit('/words/new')
    fill_in('name', :with => 'elephant')
    click_button('Add Word')
    visit('words/1/definitions/new')
    fill_in('definition', :with => 'spirit animal')
    click_button('Add Definition')
    visit('words/1/definitions/new')
    fill_in('definition', :with => 'awesome animal')
    click_button('Add Definition')
    visit('/words/1')
    expect(page).to have_content('awesome animal')
  end
end

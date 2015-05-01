require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application

describe('the definition path', {:type => :feature}) do
  it('processes the user entry . ..') do
    visit('/')
  

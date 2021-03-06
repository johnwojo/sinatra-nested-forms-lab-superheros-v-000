require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
      erb :super_hero
    end


    post '/teams' do
      @team = Team.new(name: params[:team][:name], motto: params[:team][:motto])
      heroes = params[:team][:heroes]
      @super_heroes = heroes.collect do |hero|
        Super_hero.new({name: hero[:name],power: hero[:power], bio: hero[:bio]})
      end
      erb :team
    end
end

require 'bundler'
Bundler.require

require './models/model.rb'

class MyApp < Sinatra::Base
	
	get '/' do
		erb :index
	end
	
	get '/questions' do
		@qnum = 1
		@questions = "Are you under 18 years of age? (Please answer truthfuly)"
		erb :questions
		
	end
	
	post '/questions' do
		curr_question = params[:question]
		@answer = params[:ans]
		@back = params[:back]
		
		if @answer == "Yes"
			@ans_value=0
		elsif @answer == "No"
			@ans_value=1
		end

		map={
			"Are you under 18 years of age? (Please answer truthfuly)" => {:next_q => ["Are you being forced to do anything at all?", "Are you trading sex for anything of monetary value?"], :remove => []},
			
			"Are you being forced to do anything at all?" => {:next_q => ["r", "Do you want to point and click click click...?"], :remove => []},
			
			"Are you on drugs?" => {:next_q =>["rez", "Do you want to feel like you are?"], :remove => []},
			
			"Do you want to feel like you are?" => {:next_q => ["Dangerously Flashing Lights Game", "Is your timing good?"], :remove => []},
			
			"Is your timing good?" => {:next_q => ["You want to rock out?", "Are 2 buttons too many for you?"], :remove => []},
			
			"You want to rock out?" => {:next_q => ["rockband", "ikaruba"], :remove => []},
			
			"Are 2 buttons too many for you?" => {:next_q => ["pacman", "punchout"], :remove => []},
			
			"Do you want to point and click click click...?" => {:next_q => ["Do you plan on playing for the next week straight?", "Do you want the hardest game ever?"], :remove => []},
			
			"Do you want the hardest game ever?" => {:next_q => ["unknow", "monkeyball"], :remove => []},
			
			"Do you plan on playing for the next week straight?" => {:next_q => ["wow", "diablo"], :remove => []},
			
			"Are you trading sex for anything of monetary value?" => {:next_q => ["minecraft", "Do you want to solve some puzzles?"], :remove => []},
			
			"Do you want to solve some puzzles?" => {:next_q => ["Do you feel the need for a storyline as well?", "Do you enjoy simulations?"], :remove => []},
			
			"Do you feel the need for a storyline as well?" => {:next_q => ["Are you an Edward Gorey fan?", "Kick it oldschool?"], :remove => []},
			
			"Are you an Edward Gorey fan?" => {:next_q => ["limbo", "Looking for crazy Japanese awesomeness?"], :remove => []},
			
			"Kick it oldschool?" => {:next_q => ["tetris", "lumines"], :remove => []},
			
			"Looking for crazy Japanese awesomeness?" => {:next_q => ["katamari_damacy", "Yes for shiny textures and No for indi-magic?"], :remove => []},
			
			"Yes for shiny textures and No for indi-magic?" => {:next_q => ["portal", "braid"], :remove => []},
		
		"Do you enjoy simulations?" => {:next_q => ["Do you want to be in charge of a City?", "Do you have multiple local players?"], :remove => []},
	
	"Do you want to be in charge of a City?" => {:next_q => ["cities_skyline", "sims"], :remove => []},

			"Do you have multiple local players?" => {:next_q => ["Button mashable?", "Do you want to lose yourself in another world?"], :remove => []},
			
			"Do you want to lose yourself in another world?" => {:next_q => ["Under Construction", "Under Construction"], :remove => []},
			
			"Button mashable?" => {:next_q => ["Does realistic violence upset you?", "Do you own any official team jerseys?"], :remove => []},
			
			"Does realistic violence upset you?" => {:next_q => ["super_smash_bros", "Do you like big-ass weapons?"], :remove => []},
			
			"Do you own any official team jerseys?" => {:next_q => ["easports", "Does the sound of squealing tires excite you?"], :remove => []},
			
			"Do you like big-ass weapons?" => {:next_q => ["soulcalibur", "Do you want to tear out your opponent's spine?"], :remove => []},
			
			"Does the sound of squealing tires excite you?" => {:next_q => ["Under Construction", "Under Construction"], :remove => []},
			
			"Do you want to tear out your opponent's spine?" => {:next_q => ["mortal_kombat", "unkown"], :remove => []},
			}
		
		@questions = map[curr_question][:next_q][@ans_value]

		if @questions.include? '?'
			erb :questions
		elsif @questions=="Victim"
			erb :victim
		elsif @questions=="NotVictim"
			erb :notVictim
		else
			erb :nothing
		end

	end
end
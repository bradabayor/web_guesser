require 'sinatra'
require 'sinatra/reloader'

def generate_rand
	rand(100)
end

secret_number = generate_rand
guesses_remaining = 5

get '/' do
	guess = params["guess"]
	message = check_guess(guess)
	color = change_bg_color(guess)

	params["cheat"] == true ? cheat = false : cheat = true

	guesses_remaining =- 1

	if guesses_remaining == 0
		generate_secret_number
		guesses_remaining = 5
	end

	erb :index, :locals => {:number => secret_number, :message => message, :color => color, :cheat => cheat}
end

def generate_rand
	rand(100)
end

def check_guess(num)
	if num.nil?
		"Pick a Number"
	else
		if num.to_i < (secret_number - 5)
			"Way Too Low"
		elsif num.to_i > (secret_number + 5)
			"Way Too High"	
		elsif num.to_i > secret_number
			"Too High"
		elsif num.to_i < secret_number
			"Too Low"
		else
			"Congratulations, You Guessed the Number!"
		end
	end
end

def change_bg_color(num)
	if num.nil?
		"white"
	else
		if num.to_i < (secret_number - 5)
			"red"
		elsif num.to_i > (secret_number + 5)
			"red"	
		elsif num.to_i > secret_number
			"yellow"
		elsif num.to_i < secret_number
			"yellow"
		else
			"green"
		end
	end
end
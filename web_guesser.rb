require 'sinatra'
require 'sinatra/reloader'

set :SECRET_NUMBER, rand(100)

def check_guess(num)
	if num.nil?
		"Pick a Number"
	else
		if num.to_i < (SECRET_NUMBER - 5)
			"Way Too Low"
		elsif num.to_i > (SECRET_NUMBER + 5)
			"Way Too High"	
		elsif num.to_i > SECRET_NUMBER
			"Too High"
		elsif num.to_i < SECRET_NUMBER
			"Too Low"
		else
			"Congratulations, You Guessed the Number!"
		end
	end
end

get '/' do
	guess = params["guess"]
	message = check_guess(guess)
	erb :index, :locals => {:number => SECRET_NUMBER, :message => message}
end


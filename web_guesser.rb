require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

def check_guess(num)
	if num.nil?
		"Pick a Number"
	elsif num == SECRET_NUMBER
		"You Got It Right!"
	elsif num > SECRET_NUMBER
		"Too High"
	elsif num < SECRET_NUMBER
		"Too Low"
	else
		return nil
	end
end

get '/' do
	message = check_guess(params["guess"].to_i)
	erb :index, :locals => {:number => SECRET_NUMBER, :message => message}
end


require "sinatra"
require "sinatra/reloader"
require "active_support/all"

get("/howdy") do
  erb(:hello)
end

get("/goodbye") do
  erb(:bye)
end

get("/square/new") do
  erb(:new_square_calc)
end

get ("/square/results") do
  @the_num = params.fetch("users_number").to_f

  @the_result = @the_num ** 2
  
  erb(:square_results)
end

get ("/square_root/new") do
  erb(:new_square_root_calc)
end

get ("/square_root/results") do
  @the_num = params.fetch("users_number").to_f

  @the_result = @the_num ** 0.5

  erb(:square_root_results)
end

get ("/payment/new") do
  erb(:new_payment_calc)
end

get ("/payment/results") do
  @the_r = params.fetch("users_apr").to_f
  @the_n = params.fetch("users_years").to_f * 12
  @the_pv = params.fetch("users_principal").to_f

  @numerator = (@the_r * 0.01 / 12) * @the_pv
  @denominator = 1 - ((1 + @the_r) ** (@the_n * -1))

  @the_result = @numerator / @denominator

  erb(:payment_results)
end

get ("/random/new") do
  erb(:random_new)
end

get ("/random/results") do
  @rand_min = params.fetch("users_min").to_f
  @rand_max = params.fetch("users_max").to_f

  @rand_result = rand(@rand_min..@rand_max)

  erb(:random_results)
end


get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end

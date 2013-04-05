require 'Faker'

get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/urls' do
  @url = Url.find_by_full_url(params[:url])
  if not @url
    @url = Url.create :full_url => params["url"],
    :short_url => "#{Faker::Name.prefix}#{Faker::Company.bs}#{rand(999)}".gsub(/\s+/, "").downcase
  end
  erb :index
end

# e.g., /q6bda
get '/:short_url' do
  Url.increment_counter(:counter, Url.find_by_short_url(params[:short_url]).id)
  redirect to(Url.find_by_short_url(params[:short_url]).full_url)
end

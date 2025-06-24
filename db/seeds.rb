%w[
  users
  products
  feedbacks
].each do |seed_file|
  require File.expand_path("../seeds/#{seed_file}", __FILE__)
end

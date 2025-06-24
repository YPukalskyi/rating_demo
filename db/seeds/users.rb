puts "\t\t\t---===[ Seeding users... ]===---"

10.times do
  FactoryBot.create(:user)
end

puts "\t\t\t---===[ Seeding products... ]===---"

25.times do
  FactoryBot.create(:product)
end

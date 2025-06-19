puts "\t\t\t---===[ Seeding feedbacks... ]===---"

100.times do
  FactoryBot.create(:feedback)
end

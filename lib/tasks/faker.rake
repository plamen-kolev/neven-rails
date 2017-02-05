namespace :faker do
  desc "TODO"
  task init: :environment do
    Rake::Task['db:purge'].invoke
    Rake::Task['db:migrate'].invoke

    for i in 0..3 do
      slide = Slide.new
      slide.title = Faker::Book.title
      slide.url = Faker::Internet.url
      slide.image = Faker::Avatar.image("my-own-slug", "500x500")
      slide.description_en = Faker::Hipster.paragraph(1)
      slide.description_nb = Faker::Hipster.paragraph(1)
      slide.save
    end
  end

end

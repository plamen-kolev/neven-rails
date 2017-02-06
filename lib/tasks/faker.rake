namespace :faker do
  desc "TODO"
  task init: :environment do
    Rake::Task['db:purge'].invoke
    Rake::Task['db:migrate'].invoke

    slides = 3
    categories = 4
    products = 10
    stockists = 4

    for i in 0..slides do
      slide = Slide.new
      slide.title = Faker::Book.title
      slide.url = Faker::Internet.url
      slide.image = Faker::LoremPixel.image
      slide.description = Faker::Hipster.paragraph(1)
      slide.save
    end

    for i in 0..categories do
      category = Category.new
      category.title = Faker::Commerce.department
      category.thumbnail = Faker::LoremPixel.image
      category.description = Faker::Hipster.paragraph(50)
      category.save
    end

    for i in 0..products do
      featured_odds = rand(0..100)
      in_stock_odds = rand(0..100)

      product = Product.new
      product.title = Faker::Commerce.product_name
      product.thumbnail = Faker::LoremPixel.image
      product.hover_thumbnail = Faker::LoremPixel.image

      product.tags = Faker::Lorem.word
      product.price = Faker::Commerce.price
      product.hidden_tags = Faker::Lorem.word
      product.description = Faker::Lorem.paragraph(50)
      product.tips = Faker::Lorem.paragraph(50)
      product.benefits = Faker::Lorem.paragraph(50)
      product.featured = (featured_odds < 80)
      product.in_stock = (in_stock_odds < 80)
      product.category = Category.order("RANDOM()").first
      product.save
    end

    # generate heros
    hero = Hero.new
    hero.video = 'bee.webm'
    hero.image =  'bee.jpg'
    hero.title = Faker::Hipster.sentence(1)
    hero.save

    hero = Hero.new
    hero.video = 'lavander2.ogv'
    hero.image =  'lavander.jpg'
    hero.title = Faker::Hipster.sentence(1)
    hero.save

    hero = Hero.new
    hero.video = 'mountain_clouds.webm'
    hero.image = 'mountain_clouds.jpg'
    hero.title = Faker::Hipster.sentence(1)
    hero.save

    hero = Hero.new
    hero.video = 
    hero.image =
    hero.title = Faker::Hipster.sentence(1)
    hero.save

    hero = Hero.new
    hero.video = 
    hero.image =
    hero.title = Faker::Hipster.sentence(1)
    hero.save

    hero = Hero.new
    hero.video = 'northern.webm'
    hero.image = 'northern.jpg'
    hero.title = Faker::Hipster.sentence(1)
    hero.save

    hero = Hero.new
    hero.video = 'riverlapse.webm'
    hero.image = 'riverlapse.jpg'
    hero.title = Faker::Hipster.sentence(1)
    hero.save

    for i in 0..stockists do
      stockist = Stockist.new
      stockist.title = Faker::Company.name
      stockist.address = Faker::Address.street_address
      stockist.lat = Faker::Address.latitude
      stockist.lng = Faker::Address.longitude
      stockist.thumbnail = Faker::LoremPixel.image
      stockist.save
    end
  end



end

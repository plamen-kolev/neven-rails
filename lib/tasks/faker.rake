namespace :faker do
  desc "TODO"
  task init: :environment do
    Rake::Task['db:purge'].invoke
    Rake::Task['db:migrate'].invoke

    slides = 4
    categories = 4
    products = 10
    stockists = 5
    images_per_product = 4
    product_options = 4
    ingredients = 20
    ingredients_per_product = 4

    # create ingredients
    for i in 1..ingredients do
      Ingredient.create(
        thumbnail: Faker::LoremPixel.image,
        title:  Faker::Commerce.product_name,
        description: Faker::Hipster.paragraph(1)
      )
    end

    for i in 1..slides do
      Slide.create(
        title: Faker::Commerce.product_name,
        url: Faker::Internet.url,
        image: Faker::LoremPixel.image,
        description: Faker::Hipster.paragraph(1)
      )
    end

    for i in 1..categories do
      Category.create(
        title: Faker::Commerce.department,
        thumbnail: Faker::LoremPixel.image,
        description: Faker::Hipster.paragraph(50)
      )
    end

    for i in 1..products do
      featured_odds = rand(0..100)
      in_stock_odds = rand(0..100)

      product = Product.new
      product.title = Faker::Commerce.product_name
      product.thumbnail = Faker::LoremPixel.image
      product.hover_thumbnail = Faker::LoremPixel.image

      product.tags = Faker::Lorem.word
      # product.price = Faker::Commerce.price
      product.hidden_tags = Faker::Lorem.word
      product.description = Faker::Lorem.paragraph(50)
      product.tips = Faker::Lorem.paragraph(50)
      product.benefits = Faker::Lorem.paragraph(50)
      product.featured = (featured_odds < 80)
      product.in_stock = (in_stock_odds < 80)
      product.category = Category.order("RANDOM()").first

      product.save
      
      # associate ingredient with product
      rand_ingredients = Ingredient.order("RANDOM()").limit(10)
      
      rand_ingredients.each do |ingredient|
        product.ingredients << ingredient
      end
      product.save
      
      # create images
      for i in 1..images_per_product do
        product_image = ProductImage.create(thumbnail: Faker::LoremPixel.image, product_id: product.id)
      end

      # create product options
      for i in 1..product_options do
        product_option = ProductOption.create(title: Faker::Lorem.word, weight: rand(1..100), price: Faker::Commerce.price, product_id: product.id)
      end
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

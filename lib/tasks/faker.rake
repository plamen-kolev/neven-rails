namespace :faker do
  desc "TODO"
  task init: :environment do
    Rake::Task['db:purge'].invoke
    Rake::Task['db:migrate'].invoke

    slides = 3
    categories = 4
    products = 10

    for i in 0..slides do
      slide = Slide.new
      slide.title = Faker::Book.title
      slide.url = Faker::Internet.url
      slide.image = 'http://lorempixel.com/1000/600/'
      slide.description = Faker::Hipster.paragraph(1)
      slide.save
    end

    for i in 0..categories do
      category = Category.new
      category.title = Faker::Commerce.department
      category.thumbnail = 'http://lorempixel.com/1000/600/'
      category.description = Faker::Hipster.paragraph(50)
      category.save
    end

    for i in 0..products do
      featured_odds = rand(0..100)
      in_stock_odds = rand(0..100)

      product = Product.new
      product.title = Faker::Commerce.product_name
      product.thumbnail = 'http://lorempixel.com/1000/600/'
      product.hover_thumbnail = 'http://lorempixel.com/1000/600/'

      product.tags = Faker::Lorem.word
      product.price = Faker::Commerce.price
      product.hidden_tags = Faker::Lorem.word
      product.description = Faker::Lorem.paragraph(50)
      product.tips = Faker::Lorem.paragraph(50)
      product.benefits = Faker::Lorem.paragraph(50)
      product.featured = (featured_odds > 80)
      product.in_stock = (in_stock_odds < 80)
      product.category = Category.order("RANDOM()").first
      product.save
    end
  end

end

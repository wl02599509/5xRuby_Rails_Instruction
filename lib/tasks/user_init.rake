namespace :blog do
  desc "建立初始資料"
  task :init => :environment do
    # init user, blog, and articles
    5.times {
      u = User.create(email: Faker::Internet.email, password: "123456")

      blog = u.create_blog(
        handler: Faker::Name.unique.name.downcase.gsub(" ", "_").delete("."),
        title: Faker::Lorem.sentence,
        description: Faker::Lorem.paragraphs(number: 2).join
      )
      puts "blog #{blog.handler} created"

      20.times {
        article = u.articles.create(
          title: Faker::Lorem.sentence,
          content: Faker::Lorem.paragraphs(number: 5).join
        )
        puts "  title: #{article.title} created"
      }
      puts "user: #{u.email} created!"
    }
  end
end

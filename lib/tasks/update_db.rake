require 'yaml'

namespace :update_db do
  desc 'TODO'
  task add_articles: :environment do
    path = File.join(Rails.root, 'articles.yml')

    if File.exist?(path)
      data = YAML::load(File.open(path))
      add_articles(data)
    else
      puts 'File can not be found'
    end
  end

  task :delete_articles, [:title] => :environment do |t, args|
    Article.find_by(title: args[:title]).destroy
  end

  private

  def add_articles(data)
    data.each do |article|
      if Article.exists?(act_text: article['act_text'])
        puts 'Article already exists'
      else
        Article.create(title: article['title'],
                       description: article['description'],
                       act_text: article['act_text'])
      end
    end
  end
end

require 'yaml'

namespace :update_db do
  desc 'Updates the db with all of the new articles written'
  task add_articles: :environment do
    path = File.join(Rails.root, 'articles.yml')

    if File.exist?(path)
      file = File.open(path)
      data = YAML.safe_load(file)
      add_articles(data)
    else
      puts 'File can not be found'
    end
  end

  task :delete_article, [:title] => :environment do |t, args|
    if Article.find_by(title: args[:title]).destroy
      puts 'Article successfully destroyed'
    else
      puts "There's had been an issue...lord knows"
    end
  end

  task :update_article, [:article_title, :entity, :new_content] => :environment do |t, args|
    if Article.find_by(title: args[:article_title]).update!(args[:entity] =>
                                                            args[:new_content])
      puts "#{args[:article_title]} was updated"
    else
      puts "Me thinks there be an issue with your
            so called #{args[:article_title]} article"
    end
  end

  task update_articles: :environment do
    path = File.join(Rails.root, 'articles.yml')

    if File.exist?(path)
      file = File.open(path)
      data = YAML.safe_load(file)
      update_all_articles(data)
    end
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

        puts 'Article added'
      end
    end
  end

  def update_all_articles(data)
    data.each do |article|
      if art = Article.find_by(title: article['title'])
        art.update(act_text: article['act_text']) if art.act_text != article['act_text']
      else
        puts 'Something went wrong, or no need to update'
      end
    end
  end
end

namespace :db do
  namespace :seed do
    desc "Loads the seed data from last dump in seed_dump/*"
    task last: :environment do
      filename = Dir[File.join(Rails.root, 'db', 'seeds', "*.rb")].last
      if File.exist?(filename)
        puts "Seeding #{filename}..."
        models = [EventPerson, Person, Resource, Event]
        DatabaseCleaner.clean_with(:truncation, :only => models.map(&:table_name))
        load(filename)
      else
        puts "No seed file in db/seeds"
      end
    end
  end
end

require "populator"

namespace :dev do
  desc "Rebuild system"
  task :build => ["tmp:clear","log:clear","db:drop","db:create","db:migrate","dev:fake"]
  task :rebuild => ["dev:build","db:seed"]

  desc "Setup system data"
  task :fake => :environment do
    Board.populate(10) do |b|
      b.name = Populator.words(3..5)

      Post.populate(1..20) do |p|
        p.title = Populator.words(3..5)
        p.content = Populator.sentences(7..10)
        p.board_id = b.id
      end
    end
  end
end
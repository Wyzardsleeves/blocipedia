class Wiki < ActiveRecord::Base
  belongs_to :user
end

=begin (rake results)
invoke  active_record
      create    db/migrate/20170427021803_create_wikis.rb
      create    app/models/wiki.rb
      invoke    rspec
      create      spec/models/wiki_spec.rb
      invoke      factory_girl
      create        spec/factories/wikis.rb
=end

class CreateCollaborators < ActiveRecord::Migration
  def change
    create_table :collaborators do |t|

      t.timestamps null: false
    end
  end
end

#migration to get rid of 20170513103837
#rake db:migrate:down VERSION="numHere"

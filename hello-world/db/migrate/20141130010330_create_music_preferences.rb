class CreateMusicPreferences < ActiveRecord::Migration
  def change
    create_table :music do |t|
      t.belongs_to :user
      t.string :playlist

      t.timestamps
    end
  end
end

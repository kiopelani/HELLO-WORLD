class CreateSpotifyPreferences < ActiveRecord::Migration
  def change
    create_table :spotify_preferences do |t|
      t.belongs_to :user
      t.string :playlist

      t.timestamps
    end
  end
end

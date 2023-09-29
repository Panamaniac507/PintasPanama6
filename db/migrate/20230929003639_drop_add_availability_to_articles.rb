class DropAddAvailabilityToArticles < ActiveRecord::Migration[7.0]
  def change
    drop_table :add_availability_to_articles
  end
end

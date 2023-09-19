class CreateAddAvailabilityToArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :add_availability_to_articles do |t|
        add_column :articles, :availability, :integer, default:0
      t.timestamps
    end
  end
end

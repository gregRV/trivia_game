class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
    	t.references :user
    	t.string :name

      t.timestamps null: false
    end
  end
end

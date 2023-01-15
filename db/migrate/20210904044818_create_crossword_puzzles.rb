class CreateCrosswordPuzzles < ActiveRecord::Migration[6.1]
  def change
    create_table :crossword_puzzles do |t|
      t.string :title
      t.string :slug
      t.json :data

      t.timestamps
    end
  end
end

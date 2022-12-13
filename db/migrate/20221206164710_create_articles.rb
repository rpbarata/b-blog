# frozen_string_literal: true

class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table(:articles) do |t|
      t.integer(:status, null: false, default: 0)
      t.string(:title, null: false)
      t.datetime(:published_date, null: true)
      t.string(:slug, null: false)
      t.references(:author, null: false)
      t.references(:category, null: false, foreign_key: true)

      t.timestamps
    end

    add_index(:articles, :title, unique: true)
    add_index(:articles, :slug, unique: true)
  end
end

# frozen_string_literal: true

class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table(:reviews) do |t|
      t.integer(:status, null: false, default: 0)
      t.integer(:decision, null: true)
      t.references(:admin, null: true)
      t.references(:reviewable, polymorphic: true)

      t.timestamps
    end

    add_index(:reviews, :status)
    add_index(:reviews, :decision)
    add_index(:reviews, :reviewable_type)
  end
end

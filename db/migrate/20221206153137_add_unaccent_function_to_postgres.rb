class AddUnaccentFunctionToPostgres < ActiveRecord::Migration[7.0]
  def up
    execute("create extension if not exists unaccent")
  end

  def down
    execute("drop extension unaccent")
  end
end

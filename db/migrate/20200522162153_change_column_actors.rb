class ChangeColumnActors < ActiveRecord::Migration[5.1]
  def change
    change_column :actors, :age, :float, using: 'age::float'
  end
end

class ChangeColumnInActors < ActiveRecord::Migration[5.1]
  def change
    change_column :actors, :age, :integer, using: 'age::integer'
  end
end

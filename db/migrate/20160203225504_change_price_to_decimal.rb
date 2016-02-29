class ChangePriceToDecimal < ActiveRecord::Migration
  def change
    reversible do |dir|
      change_table :products do |t|
        dir.up   { t.change :price, :decimal, precision: 5, scale: 2 }
        dir.down { t.change :price, :integer }
      end
    end
  end
end

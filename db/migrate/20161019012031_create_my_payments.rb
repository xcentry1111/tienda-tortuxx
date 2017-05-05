class CreateMyPayments < ActiveRecord::Migration[5.0]
  def change
    create_table :my_payments do |t|
      t.string :email
      t.string :ip
      t.string :estado
      t.decimal :fee, precision: 6, scale: 2
      t.string :paypal_id
      t.decimal :total, precision: 8, scale: 2

      t.timestamps
    end
  end
end
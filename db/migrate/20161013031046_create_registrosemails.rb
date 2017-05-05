class CreateRegistrosemails < ActiveRecord::Migration
  def change
    create_table :registrosemails do |t|
      t.string :email
      t.string :ip
      t.integer :estado

      t.timestamps null: false
    end
  end
end

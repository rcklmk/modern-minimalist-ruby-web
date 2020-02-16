class InitDatabase < ActiveRecord::Migration[5.1]
  def change
    create_table :bills do |t|
      t.string     :type
      t.bigint     :amount
      t.integer    :billing_year
      t.integer    :billing_month
      t.date       :paid_date
      t.timestamps
    end
  end
end

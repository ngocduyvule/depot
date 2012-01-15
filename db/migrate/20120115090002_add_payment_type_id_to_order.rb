class AddPaymentTypeIdToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :payment_type_id, :integer
  end
end

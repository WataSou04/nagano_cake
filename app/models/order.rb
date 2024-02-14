class Order < ApplicationRecord
  has_many :order_detail, dependent: :destroy
  belongs_to :customer
  
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { waiting_payment: 0, payment_confirmation: 1, in_production: 2, in_preparation: 3, sent: 4 }
end

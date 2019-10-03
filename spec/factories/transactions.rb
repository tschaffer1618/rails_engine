FactoryBot.define do
  factory :transaction do
    invoice
    credit_card_number { rand(1000000000000000..9999999999999999).to_s }
    credit_card_expiration_date { nil }
    result { ["success", "failed"].sample }
  end
end

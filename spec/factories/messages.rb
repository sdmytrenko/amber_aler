FactoryGirl.define do
  factory :message do
    user nil
    emergency nil
    text "MyText"
    claim_closed false
  end
end

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :reservation do
    email "MyText"
    requested_date "2013-11-18 19:50:58"
    message "MyString"
    restaurant nil
  end
end

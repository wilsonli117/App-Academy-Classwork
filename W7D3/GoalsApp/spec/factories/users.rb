

FactoryBot.define do
    factory :user do
        username { Faker::Superhero.name }
        password { "password" }
    end
end




#FROM LECTURE
# FactoryBot.define do
#   factory :user do
#     username { Faker::Games::Pokemon.name } # a block will execute each time a user is created with the factory
#     password "hunter12"
#     association :location, factory: :location
#   end
# end

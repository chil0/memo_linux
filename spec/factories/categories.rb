FactoryBot.define do
  factory :categories, class: Category do
    factory :c_meet do
      id { 1 }
      name { 'Meet with friend' }
    end
    factory :c_todo do
      id { 2 }
      name { 'ToDo List' }
    end
  end
end

FactoryBot.define do
  factory :memos, class: Memo do
    factory :memo1 do
      id { 1 }
      association :category, factory: :c_meet
      content { "Meet with friend, at 18:20" }
    end
    factory :memo1_wrong, parent: :memo1 do
      category_id { 0 }
    end
    factory :memo1_new, parent: :memo1 do
      content { "Meet with friend, at 19:00" }
    end
    factory :memo2 do
      id { 2 }
      association :category, factory: :c_todo
      category_id { 2 }
      content { "Report writing" }
    end
  end
end

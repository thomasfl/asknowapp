Factory.define :question do |q|
  q.sequence(:user_id) { |n| n }
  q.sequence(:description) { |n|  "description#{n}"  }
end
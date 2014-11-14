FactoryGirl.define do
  factory :user do

    factory :manager, :class => User do
      name_user "Manager"
      fub_registry  "126565124"
      siape_registry "1726817"
      cost_center  "IB"
      admission_date  "2015-03-10"
      password  "123456"
      password_confirmation "123456"
      is_active_user "true"
      after(:create) {|user| user.add_role(:manager)}
    end

    factory :admin, :class => User do
      name_user "Admin"
      fub_registry  "126566524"
      siape_registry "17249817"
      cost_center  "IB"
      admission_date  "2015-03-10"
      password  "123456"
      password_confirmation "123456"
      is_active_user "true"
      after(:create) {|user| user.add_role(:admin)}
    end

    factory :external, :class => User do
      name_user "External"
      fub_registry  "126524"
      siape_registry "17249917"
      cost_center  "IB"
      admission_date  "2015-03-10"
      password  "123456"
      password_confirmation "123456"
      is_active_user "true"
      after(:create) {|user| user.add_role(:external_user)}
    end

  end
end

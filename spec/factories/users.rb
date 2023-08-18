FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'a00000'}
    password_confirmation {password}
    first_name            {'test'}
    family_name           {'test'}
    first_name_kana       {'test'}
    family_name_kana      {'test'}
    birth_day             {'test'}
  end
end

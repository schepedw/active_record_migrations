require 'faker'

ActiveRecord::Base.transaction do
  %w(saving checking money_market).each do |account|
    AccountType.create!(:name => account)
  end

  10.times do
    unique_ssn = Faker::Number.number(9).to_i
    while (User.where(:ssn => unique_ssn).present?)
      unique_ssn += 1
    end
    User.create!(
      :first_name => Faker::Name.first_name,
      :last_name => Faker::Name.last_name,
      :ssn => Faker::Number.number(9).to_i
    )
  end

  10.times do
    account_type_id = (AccountType.first.id .. AccountType.last.id).to_a.sample
    user_id = (User.first.id .. User.last.id).to_a.sample
    Account.create!(
      account_type_id: account_type_id,
      user_id: user_id
    )
  end

end

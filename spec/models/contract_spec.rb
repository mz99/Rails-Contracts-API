require 'rails_helper'

RSpec.describe Contract, type: :model do
  it "is valid with a vendor, starts on, ends on, and price" do
    user = User.create(
      full_name: "Tester test",
      email: "test@test.com",
      password: "123456"
    )
    contract = user.contracts.create(
      vendor: "Vodaphone",
      starts_on: "2018-12-12",
      ends_on: "2018-12-14",
      price: 15,
    )
    expect(contract).to be_valid
  end

  it "is invalid if the end date is before the start date" do
    user = User.create(
      full_name: "Tester test",
      email: "test@test.com",
      password: "123456"
    )
    contract = user.contracts.create(
      vendor: "Vodaphone",
      starts_on: "2018-12-12",
      ends_on: "2018-12-11",
      price: 15,
    )
    expect(contract.errors[:ends_on]).to include("Ends on date should be greater than start date")
  end
end

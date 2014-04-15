require 'spec_helper'

describe User do
  it { should validate_uniqueness_of :email }
  it { should have_many :tweets}

  it 'should send a welcome email on user create' do
    new_user = User.new(handle: 'Boo',email: 'boo@goo.com', password:'123', password_confirmation:'123')
    expect(UserMailer).to receive(:signup_confirmation).with(new_user)
    new_user.save
  end
end

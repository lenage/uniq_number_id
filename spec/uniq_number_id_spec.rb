require 'spec_helper'

describe 'uniq number id' do
  before(:each) do
    @user = User.new
    @user.run_callbacks :create
  end

  it 'should has uniq number id' do
    expect(@user.member_number).to be_a Fixnum
  end

  it 'should uniq number id has length 8 by default' do
    expect(@user.member_number.to_s.length).to eq(8)
  end

  it 'should renew uniq number id' do
    old_num = @user.member_number
    expect(@user.renew_member_number).to be true
    expect(@user.member_number).not_to eq(old_num)
  end
end

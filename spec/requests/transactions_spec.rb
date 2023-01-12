require 'rails_helper'

RSpec.describe 'Groups', type: :request do
  before(:each) do
    user = User.create email: 'tom@example.com', password: '123456'
    post user_session_path, params: { user: { email: user.email, password: user.password } }
    get root_path

    @group = Group.new(name: "My group name", user_id: 1)
    @group.save

    transaction = Transaction.new(name: "My transaction", amount: 100, user_id: 1, group_id: @group.id)
    transaction.save
  end
end

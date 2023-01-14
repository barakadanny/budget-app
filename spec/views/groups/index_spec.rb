RSpec.describe 'groups/index', type: :view do
  before(:each) do
    user = User.create email: 'tom@example.com', password: '123456'
    @groups = assign(:groups, [
                       Group.create!(name: 'Group 1', user: user, icon: 'https://kenyanwallstreet.com/wp-content/uploads/2022/05/im-bank-kenya-feature-img-3.jpg'),
                       Group.create!(name: 'Group 2', user: user, icon: 'https://kenyanwallstreet.com/wp-content/uploads/2022/05/im-bank-kenya-feature-img-3.jpg')
                     ])
    @group_sums = { 1 => 100, 2 => 200 }
  end

  it 'renders a list of groups' do
    render
    assert_select 'ul>li', count: 2
    assert_select 'ul>li>div>img[src=?]', 'https://kenyanwallstreet.com/wp-content/uploads/2022/05/im-bank-kenya-feature-img-3.jpg'
    assert_select 'ul>li>div>img[src=?]', 'https://kenyanwallstreet.com/wp-content/uploads/2022/05/im-bank-kenya-feature-img-3.jpg'
    assert_select 'ul>li>div>div>div>h3>a[href=?]', group_transactions_path(group_id: @groups[0].id)
    assert_select 'ul>li>div>div>div>p', text: 'Total Amount: 0 $'
    assert_select 'ul>li>div>div>div>p', text: 'Total Amount: 0 $'
    assert_select 'a[href=?]', new_group_path, text: 'Create Group'
    assert_select 'a[href=?]', categories_path, text: 'New Category'
  end
end

User.create!(
  email: 'admin@example.com',
  password: '12345678',
  full_name: 'Admin',
  role: 'Admin',
  address: 'Address',
  age: 50,
  approved: true,
  confirmed_at: Time.now.utc
)

manager = User.create!(
  email: 'manager@example.com',
  password: '12345678',
  full_name: 'Van Manager',
  role: 'Manager',
  address: 'Kyiv',
  age: 19,
  approved: true,
  confirmed_at: Time.now.utc
)

user = User.create!(
  email: 'user@example.com',
  password: '12345678',
  full_name: 'Van User',
  role: 'User',
  address: 'Kyiv',
  age: 19,
  approved: true,
  confirmed_at: Time.now.utc
)

category = Category.create!(
  name: 'News',
  slug: 'news'
)

Post.create!(
  title: 'Post1',
  body: 'some actions',
  category: category,
  lead: 'some actions some action some action some action some action',
  user: manager
)

Post.create!(
  title: 'New Post',
  body: 'some actions',
  category: category,
  lead: 'some actions some action some action some action some action',
  user: user
)

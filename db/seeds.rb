User.create!(
  email: 'admin@example.com',
  password: 'secret1234',
  role: 'manager', admin: true,
  full_name: 'Admin',
  address: 'Address',
  age: 50)

user = User.create(
  email: 'manager@gmail.com',
  password: 12345678,
  full_name: 'Van Manager',
  address: 'Kyiv',
  aasm_state: 'approved',
  age: 19,
  admin: false,
  role: 'manager'
)

category = Category.create!(
  name: 'News',
  slug: 'ALL NEWS',
  order: 1
)

Post.create(
  title: 'new post',
  body: 'some actions',
  category: category,
  lead: 'some actions some action some action some action some action',
  user: user
)

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
  body: '**Post1** _Body_ Exmpale.',
  category: category,
  lead: 'Lead of the **New Post1** Exmpale.',
  user: manager
)

Post.create!(
  title: 'New Post',
  body: '**New Post** _Body_ Exmpale.',
  category: category,
  lead: 'Lead of the **New Post** Exmpale.',
  user: user
)

EditorialList.create!(
  title: 'Editorial List1',
  about: 'About Editorial List1',
  slug: 'editorial-list1'
)

EditorialList.create!(
  title: 'Editorial List2',
  about: 'About Editorial List2',
  slug: 'editorial-list2'
)

# encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Activity.delete_all
User.delete_all
Product.delete_all
Factory.delete_all
Variant.delete_all
User.delete_all

Activity.create( title: '积分兑换',
	description:
		%{ 100积分兑换一盒宝洁香皂 },
	imageurl: 'label_new_green.png',
	neverexpired: true,
	status: 1,
	validfrom: DateTime.now,
	validto: DateTime.now + 10,
	point: 1
)

Activity.create( title: '积分兑换',
	description:
		%{ 会员优惠, 1000积分兑换一条高档毛巾 },
	imageurl: 'label_sale_green.png',
	neverexpired: false,
	status: 1,
	validfrom: DateTime.now,
	validto: DateTime.now + 10,
	point: 2
)

Activity.create( title: '新品热销',
	description:
		%{ 清凉夏季，宝洁相伴, 各大超市有售 },
	imageurl: 'label_sale_green.png',
	neverexpired: false,
	status: 2,
	validfrom: DateTime.now,
	validto: DateTime.now + 10,
	point: 0
)

User.create( phone: '15618965253',
	password: 'User@123',
	password_confirmation: 'User@123',
	credit: 100
)

User.create( phone: '15821333936',
	password: 'User@123',
	password_confirmation: 'User@123',
	credit: 100
)

Factory.create( name: '工厂1',
	description: '工厂1 上海 分厂',
	email: 'test@gmail.com',
	code: 'FAC1'
)

Factory.create( name: '工厂2',
	description: '工厂2 上海 分厂',
	email: 'test2@gmail.com',
	code: 'FAC2'
)

Product.create( name: '香皂',
	description: '夏季清爽系列香皂',
	code: 'PRD1',
	factory: Factory.find_by_code('FAC1'),
	point: 1
)

Product.create( name: '沐浴乳',
	description: '夏季清爽系列沐浴乳',
	code: 'PRD2',
	factory: Factory.find_by_code('FAC1'),
	point: 1
)

Variant.create( fullcode: 'FAC1PRD1XXXXXXXXXX1',
	password: '1111',
	factory: Factory.find_by_code('FAC1'),
	product: Product.find_by_code('PRD1')
)

Variant.create( fullcode: 'FAC1PRD1XXXXXXXXXX2',
	password: '1111',
	factory: Factory.find_by_code('FAC1'),
	product: Product.find_by_code('PRD1')
)

Variant.create( fullcode: 'FAC1PRD2XXXXXXXXXX1',
	password: '1111',
	factory: Factory.find_by_code('FAC1'),
	product: Product.find_by_code('PRD2')
)

Variant.create( fullcode: 'FAC1PRD2XXXXXXXXXX2',
	password: '1111',
	factory: Factory.find_by_code('FAC1'),
	product: Product.find_by_code('PRD2')
)

User.create( phone: '15618965253',
	password: 'User@123',
	password_confirmation: 'User@123',
	credit: 100
)

User.create( phone: '15821333936',
	password: 'User@123',
	password_confirmation: 'User@123',
	credit: 100
)


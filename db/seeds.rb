# encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Activity.delete_all
Variant.delete_all
Product.delete_all
Factory.delete_all
LineItem.delete_all
User.delete_all


# New.delete_all

# New.create( title: '富艺防伪中心正式上线',
# 	description:
# 		%{ 富艺防伪中心于2013年4月正式上线。。。 }
# )

# New.create( title: '富艺防伪中心与宝洁达成正式合作伙伴关系',
# 	description:
# 		%{ 富艺正式成为宝洁新型防伪技术供应商，富艺将在未来五年内为宝洁提供防伪条码技术支持。 }
# )

Activity.create( title: '积分兑换1',
	description:
		%{ 5积分兑换一盒宝洁香皂 },
	imageurl: 'label_new_green.png',
	neverexpired: true,
	status: 1,
	validfrom: DateTime.now,
	validto: DateTime.now + 200,
	point: 5
)

Activity.create( title: '积分兑换2',
	description:
		%{ 会员优惠, 10积分兑换一条高档毛巾 },
	imageurl: 'label_sale_green.png',
	neverexpired: true,
	status: 1,
	validfrom: DateTime.now,
	validto: DateTime.now + 200,
	point: 10
)

Activity.create( title: '积分兑换3',
	description:
		%{ 会员优惠, 20积分兑换一瓶洗发水 },
	imageurl: 'label_sale_green.png',
	neverexpired: true,
	status: 1,
	validfrom: DateTime.now,
	validto: DateTime.now + 200,
	point: 20
)

Activity.create( title: '积分兑换4',
	description:
		%{ 会员优惠, 30积分兑换一套洗浴产品 },
	imageurl: 'label_sale_green.png',
	neverexpired: true,
	status: 1,
	validfrom: DateTime.now,
	validto: DateTime.now + 200,
	point: 30
)

Activity.create( title: '积分兑换5',
	description:
		%{ 会员优惠, 50积分兑换豪华家庭套装 },
	imageurl: 'label_sale_green.png',
	neverexpired: true,
	status: 1,
	validfrom: DateTime.now,
	validto: DateTime.now + 200,
	point: 50
)

Factory.create( name: '宝洁中国',
	description: '宝洁中国有限公司，广东分公司',
	email: 'test@gmail.com',
	code: 'FAC1',
	logo: 'pandg.jpeg',
	scanimgurl: 'baojie_scan.png'
)

Factory.create( name: '大宝',
	description: '大宝',
	email: 'test2@gmail.com',
	code: 'FAC2',
	logo: 'dabao.jpeg',
	scanimgurl: 'dabao_scan.png'
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

for i in 0..20
	Variant.create( fullcode: "FAC1PRD1XXXXXXXXX#{i}",
		password: '1111',
		factory: Factory.find_by_code('FAC1'),
		product: Product.find_by_code('PRD1')
	)
end

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


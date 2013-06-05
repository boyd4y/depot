# encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'securerandom'

Activity.delete_all
Variant.delete_all
Product.delete_all
Factory.delete_all
LineItem.delete_all
User.delete_all
Post.delete_all
Company.delete_all

Company.create( name: '宝洁中国',
	description: '宝洁中国有限公司',
	email: 'test@gmail.com',
	password: 'password'
)

Factory.create( name: '宝洁中国',
	description: '宝洁中国有限公司，广东分公司',
	email: 'test@gmail.com',
	code: 'FAC1',
	logo: 'pandg.jpeg',
	scanimgurl: 'baojie_scan.png',
	company: Company.find_by_name('宝洁中国')
)

Product.create( name: '海飞丝',
	description: '海飞丝洗发水',
	code: 'PRD1',
	factory: Factory.find_by_code('FAC1'),
	point: 1,
	image_path: 'haifeisi.png'
)

Post.create( title: '富艺防伪中心正式上线',
	message:
		%{ 富艺防伪中心于2013年4月正式上线。。。 }
)

Post.create( title: '富艺防伪中心与宝洁达成正式合作伙伴关系',
	message:
		%{ 富艺正式成为宝洁新型防伪技术供应商，富艺将在未来五年内为宝洁提供防伪条码技术支持。 }
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

User.create( phone: '13301649473',
	password: '123456',
	password_confirmation: '123456',
	credit: 1000
)

Activity.create( title: '新品上市，积分兑换',
	description:
		%{ 5积分兑换一盒宝洁香皂 },
	imageurl: 'label_new_green.png',
	neverexpired: true,
	status: 1,
	validfrom: DateTime.now,
	validto: DateTime.now + 200,
	point: 5,
	factory: Factory.find_by_code('FAC1')
)

Activity.create( title: '积分领取热销商品',
	description:
		%{ 会员优惠, 10积分兑换一条高档毛巾 },
	imageurl: 'label_sale_green.png',
	neverexpired: true,
	status: 1,
	validfrom: DateTime.now,
	validto: DateTime.now + 200,
	point: 10,
	factory: Factory.find_by_code('FAC1')
)

Product.create( name: 'Olay',
	description: 'Olay系列',
	code: 'PRD2',
	factory: Factory.find_by_code('FAC1'),
	point: 1,
	image_path: 'olay.png'
)

Product.create( name: '飘柔',
	description: '飘柔洗发水',
	code: 'PRD3',
	factory: Factory.find_by_code('FAC1'),
	point: 1,
	image_path: 'piaorou.png'
)

for i in 0..100
	Variant.create( fullcode: "FAC1PRD1XXXXXXXXX#{i}",
		password: '1111',
		factory: Factory.find_by_code('FAC1'),
		product: Product.find_by_code('PRD1')
	)
end

locations = [
   # latitude, longitude
   # shanghai
   {:randomcount => 2, :latitude => 31.205289, :longitude => 121.614288},
   {:randomcount => 5, :latitude => 30.915186, :longitude => 121.468964},

   # wuhan
   {:randomcount => 7, :latitude => 30.626834, :longitude => 114.246826},

   # qingdao
   {:randomcount => 12, :latitude => 36.067082, :longitude => 120.38264},

   # nanjing
   {:randomcount => 10, :latitude => 32.060255, :longitude => 118.796877},

   # guangzhou
   #{:randomcount => 60, :latitude => 23.129163, :longitude => 113.264435},

   # xian
   {:randomcount => 13, :latitude => 34.341568, :longitude => 108.940175},

	#  beijing
   {:randomcount => 15, :latitude => 39.90403, :longitude => 116.407526}
]

index = 1
locations.each do |location|
	for i in 0..location[:randomcount]
	Variant.create( fullcode: "FAC1PRD1XXXXXXXXXYY#{index}#{i}",
		password: '1111',
		factory: Factory.find_by_code('FAC1'),
		product: Product.find_by_code('PRD1'),
		checked: true,
		user: User.find_by_phone("15618965253"),
		latitude: location[:latitude] + SecureRandom.random_number / 100,
		longitude: location[:longitude] + SecureRandom.random_number / 100
	)
	end
	index += 1
end




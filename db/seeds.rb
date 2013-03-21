# encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Activity.delete_all

Activity.create( title: '新品促销',
	description:
		%{ 新品促销， 各大超市均有销售 },
	image_url: 'label_new_green.png',
	neverexpired: false,
	status: 1,
	validfrom: nil,
	validto: nil 
)

Activity.create( title: '夏季促销',
	description:
		%{ 清凉夏季，宝洁相伴 },
	image_url: 'label_sale_green.png',
	neverexpired: false,
	status: 1,
	validfrom: nil,
	validto: nil 
)

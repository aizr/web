# -*- encoding : utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.new(:email => "test@gmail.com",:password => "123456", :password_confirmation => "123456")
admin.is_admin = true
admin.save!

normal_user = User.new(:email = "aizr1212@gmail.com", :password => "06080424", :password_confirmation => "06080424")
normal_user.save!
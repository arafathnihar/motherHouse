# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Add admin user
User.create(
    customId: 'MH0001',
    name: 'Shivanesan Arafath',
    contact: '0111234567',

    username: 'shiva',
    password: Digest::SHA1.hexdigest('abc@123'),

    guid: SecureRandom.uuid,
    created_by: 1
)
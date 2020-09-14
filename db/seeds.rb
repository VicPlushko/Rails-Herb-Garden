# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'


json = JSON.parse(File.read('app/assets/json/seeds.json'))
herbs = json['seeds']
herbs.each do |herb_hash|
    Herb.create(
        name: herb_hash["name"],
        latin_name: herb_hash["latin_name"],
        family: herb_hash["family"],
        medicinal_parts: herb_hash["medicinal_parts"],
        taste: herb_hash["taste"],
        energetics: herb_hash["energetics"],
        action: herb_hash["action"],
        ideal_for: herb_hash["ideal_for"],
        application: herb_hash["application"],
        dosage: herb_hash["dosage"],
        considerations: herb_hash["considerations"]

    )
end
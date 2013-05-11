namespace :db do 
	desc "Fill database with sample data"
	task populate: :environment do
		10.times do |n|
			puts "[DEBUG] creating user #{n+11} of 10"
			image = File.open(Dir.glob(File.join(Rails.root, 'sampleimages', '*')).sample)
			name = Faker::Name.name
			email = "user-#{n+11}@example.com"
			password = "password"
			User.create!( image: image,
										name: name,
				            email: email,
				            password: password,
				            password_confirmation: password )
		end

		User.all.each do |user|
			puts "[DEBUG] uploading images for user #{user.id} of #{User.last.id}"
			10.times do |n|
				image = File.open(Dir.glob(File.join(Rails.root, 'sampleimages', '*')).sample)
				description = %w(rockin baddass sweet juicy loud noisy swingin)
				artist = %w(Madonna Cher Bono Jay-z)
				album = %w(debut second third fourth)
				user.pins.create!(image: image, description: description)
			end
		end
	end	
end

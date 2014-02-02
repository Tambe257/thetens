class MyMailer < ActionMailer::Base
		def welcome_email(user)
			@user = user
			mail(to: [user.email],
					 bcc: ['tambe257@gmail.com', 'c77scott@yahoo.com'],	
				   from: 'tambe257@gmail.com',
				   subject: 'Welcome to theTens!')
		end

		def comment_email(user)
			@user = user
			mail(to: [user.email],
				   bcc: ['tambe257@gmail.com', 'c77scott@yahoo.com'],
				   from: 'tambe257@gmail.com',
				   subject: 'Hi from theTens!')
		end

		def post_alert(user)
			@user = user
			mail(to: ['tambe257@gmail.com',	'c77scott@yahoo.com'],
				   from: 'tambe257@gmail.com',
				   subject: 'Hi from theTens!')
		end
end			
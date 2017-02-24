class MyMailer < ActionMailer::Base
		def welcome_email(user)
			@user = user
			mail(to: [user.email],
					 bcc: ['tambe257@gmail.com', 'c77scott@gmail.com', 'drewmcscott@gmail.com'],	
				   from: 'tambe257@gmail.com',
				   subject: 'Welcome to theTens!')
		end

		def comment_email(user)
			@user = user
			mail(to: [user.email],
				   bcc: ['tambe257@gmail.com', 'c77scott@gmail.com', 'drewmcscott@gmail.com'],
				   from: 'tambe257@gmail.com',
				   subject: 'Hi from theTens!')
		end

		def commenter_email(user)
			@user = user
			mail(to: [user.email],
				   bcc: ['tambe257@gmail.com', 'c77scott@gmail.com', 'drewmcscott@gmail.com'],
				   from: 'tambe257@gmail.com',
				   subject: 'Hi from theTens!')
		end

		def post_alert(user)
			@user = user
			mail(to: ['tambe257@gmail.com',	'c77scott@gmail.com', 'drewmcscott@gmail.com'],
				   from: 'tambe257@gmail.com',
				   subject: 'Hi from theTens!')
		end

		def blog_alert(user)
			@user = user
			mail(to: ['tambe257@gmail.com',	'c77scott@gmail.com', 'drewmcscott@gmail.com'],
				   from: 'tambe257@gmail.com',
				   subject: 'Hi from theTens!')
		end

		def blog_comment(user)
			@user = user
			mail(to: [user.email],
				   bcc: ['tambe257@gmail.com', 'c77scott@gmail.com', 'drewmcscott@gmail.com'],
				   from: 'tambe257@gmail.com',
				   subject: 'Hi from theTens!')
		end

		def blog_commenter_email(user)
			@user = user
			mail(to: [user.email],
				   bcc: ['tambe257@gmail.com', 'c77scott@gmail.com', 'drewmcscott@gmail.com'],
				   from: 'tambe257@gmail.com',
				   subject: 'Hi from theTens!')
		end
end			
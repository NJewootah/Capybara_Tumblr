require 'capybara'

session = Capybara::Session.new(:selenium)
session.visit('http://www.tumblr.com/login')

session.fill_in('Email',:with => "tumblrtesting1991@hotmail.com")
session.fill_in('Password',:with => "tumblrlogin")
session.click_button('Log in')

session.click_link('Text')
session.find('.title-field .editor-plaintext').set('Bond')
session.find('.caption-field .editor-richtext').set('James Bond')
session.click_button('Post')

expect(session.find('#post_buttons').find('.new_post_label_text').to have_content('Text'))

session.visit("http://megamellowmagazinepatrol.tumblr.com/")
if session.first('.title').text == 'Bond' && session.first('.body-text').text == 'ames Bond'
  puts "Message successfully uploaded"
else
  puts "Message failed to upload"
end
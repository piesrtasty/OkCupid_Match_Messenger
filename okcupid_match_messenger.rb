# require dependencies
require 'rubygems'
require 'watir'

# Create a new browser object
browser = Watir::IE.new

# Specify the OkCupid URL
url = "http://www.okcupid.com"

# Navigate the browser to okcupid.com
browser.goto url

# Enter the username
browser.text_field(:id, "sidebar_signin_username").set "okcupidmatcher"
# Enter the password
browser.text_field(:id, "sidebar_signin_password").set "nomorenerds"

# Click the signin button
browser.form(:id, "sidebar_signin_form").submit

# Click on the "Matches" link
browser.link(:text, "Matches").click

# Sleep the browser to manually do infinite scroll
sleep 10
puts "Done Sleeping"

# Instantiate an array to hold the usernames of all your matches
usernames = []

# Get all the spans on the page
all_spans = browser.spans

# Loop through the spans and only pull out the text of those with a class of 'username'
all_spans.each do |span|
  if span.class_name == "username"
    usernames << span.text
  end
end

# Loop through the users to send each a message
usernames.each do |username|
  # Concatenate a url to the Non-JS version of the message send page
  nonjs_url = "http://www.okcupid.com/messages?r1=" + username + "&compose=1"
  # Navigate the browser to the message send page
  browser.goto nonjs_url
  # Sleep the browser to let the page load
  sleep 5
  puts "done sleeping"
  # Set the message body
  browser.text_field(:name, 'body').set("hi")
  # Send the message
  browser.link(:text, "Send").click
end
















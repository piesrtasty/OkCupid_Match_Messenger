require 'safariwatir'

# Create a new browser object
browser = Watir::Safari.new
# Specify the OkCupid URL
url = "http://www.okcupid.com"

# Navigate the browser to okcupid.com
browser.goto url

# Enter the username
browser.text_field(:id, "sidebar_signin_username").set "okcupidmatcher"
# Enter the password
browser.password(:id, "sidebar_signin_password").set "nomorenerds"

# Click the signin button
browser.form(:id, "sidebar_signin_form").submit

# Get all links on the page
links = browser.links

# Find the link with text "Matches"
links.each do |link|
  if link.text == "Matches"
    link.click
  end
end

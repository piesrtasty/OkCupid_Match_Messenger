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

# Sleep the browser to manually do infinite scroll
# sleep 10
# puts "Done Sleeping"

span_count = 0

usernames = []

all_spans = browser.spans

all_spans.each do |span|
  span_count += 1
  if span.class_name == "username"
    usernames << span.text
  end
end

profile_url = "http://www.okcupid.com/profile/" + usernames[0] + "?cf=regular"

browser.goto profile_url

if browser.link(:id, "match-perc-stoplight-red").exists?
  puts "we got a red"
  browser.link(:id, "match-perc-stoplight-red").click()
elsif browser.link(:id, "match-perc-stoplight-yellow").exists?
  puts "we got a yellow"
  browser.link(:id, "match-perc-stoplight-yellow")
elsif browser.link(:id, "match-perc-stoplight-green").exists?
  puts "we got a green"
  browser.link(:id, "match-perc-stoplight-green")
end



# match-perc-stoplight-red
# match-perc-stoplight-yellow
# match-perc-stoplight-yellow

# http://www.okcupid.com/profile/BaileyGinNYC?cf=regular
 
puts span_count
puts ""
puts usernames

# Attempt 1

# profile_links = browser.links(:class, 'ajax_load_profile_link')
# 
# count = 0
# 
# profile_links.each do |pl|
#   count += 1
# end
# 
# puts count

# Attempt 2

# link_count = 0
# 
# profile_links = []
# 
# all_links = browser.links
# 
# all_links.each do |al|
#   link_count += 1
#   puts al.class_name
# 
# end
#  
# puts count
# 
# 



















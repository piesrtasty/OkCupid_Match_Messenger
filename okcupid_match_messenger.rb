# require 'safariwatir'
require 'rubygems'
require 'watir'

# Create a new browser object
# browser = Watir::Safari.new
browser = Watir::IE.new

# Specify the OkCupid URL
url = "http://www.okcupid.com"

# Navigate the browser to okcupid.com
browser.goto url

# Enter the username
browser.text_field(:id, "sidebar_signin_username").set "okcupidmatcher"
# Enter the password
# browser.password(:id, "sidebar_signin_password").set "nomorenerds"
browser.text_field(:id, "sidebar_signin_password").set "nomorenerds"

# Click the signin button
browser.form(:id, "sidebar_signin_form").submit

# Get all links on the page
links = browser.links

# Find the link with text "Matches"
#links.each do |link|
#  if link.text.include? "Matches"
#    link.click
#  end
#end
browser.link(:text, "Matches").click

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

# profile_url = "http://www.okcupid.com/profile/" + usernames[0] + "?cf=regular"

nonjs_url = "http://www.okcupid.com/messages?r1=" + usernames[0] + "&compose=1"

# browser.goto profile_url
browser.goto nonjs_url

sleep 5
puts "done sleeping"

# browser.frame(:index, 0).text_field(:id, "message_text").set "LOREM IPSUM"

if browser.text_field(:name, 'body')
  browser.text_field(:name, 'body').set("hi")
else 
  puts "no"
end

browser.link(:text, "Send").click

# if browser.link(:id, "match-perc-stoplight-red").exists?
#   puts "we got a red"
#   browser.link(:id, "match-perc-stoplight-red").click()
# elsif browser.link(:id, "match-perc-stoplight-yellow").exists?
#   puts "we got a yellow"
#   browser.link(:id, "match-perc-stoplight-yellow")
# elsif browser.link(:id, "match-perc-stoplight-green").exists?
#   puts "we got a green"
#   browser.link(:id, "match-perc-stoplight-green")
# end
# 
# browser.text_field(:id, "message_text").set "LOREM IPSUM"


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



















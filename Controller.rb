require "watir-webdriver"

# for headless testing (not same as phantomjs)
# requires unix / linux env
# require 'headless'

puts "c here"

def navigate
	if $env["browser"].strip == "headless" then
		headless = Headless.new
		headless.start
		$browser = Watir::Browser.start $env["url"]
	else
	 	$browser = Watir::Browser.new :"#{$env["browser"]}"
	 	$browser.goto $env["url"]
	end
	 sleep 1
	 $browser.h1(:text => "Welcome to the Internet").wait_until_present
	 if $browser.h1(:text => "Welcome to the Internet").present? == true then
	 	$checkpoint_nav = "Navigation Successful."
	 else
	 	$checkpoint_nav = "Unable to navigate, check for the site availbility"
	 end
end


def click_link(link_name)
	$browser.a(:text => "#{link_name}").when_present.click
	sleep 4
	$checkpoint_click_link = "#{link_name} page is working."
end

def end_session
	$browser.quit
end

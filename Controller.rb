require "watir-webdriver"

def navigate 

	 $browser = Watir::Browser.new :"#{$environment["Browser"]}"
	 $browser.goto $environment["url"]

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
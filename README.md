qacloud.io
==========

Instructions:

install Ruby:
Mac:
 -- install RVM,follow the instruction here.
    http://code.tutsplus.com/tutorials/how-to-install-ruby-on-a-mac--net-21664
    make sure to install ruby version 2.0.0
Windows:
--	install Ruby 2.0.0, follow the instruction here.
	http://code.tutsplus.com/tutorials/ruby-for-newbies-installing-ruby-and-getting-started--net-15116
-- open terminal or command prompt and check your ruby version
 	ruby -v
 	it should be 2.0.0
--  windows users need to install devtools. follow the instruction here.
	https://github.com/oneclick/rubyinstaller/wiki/Development-Kit

install bundler

-- open new terminal / Command window and type:
	gem install bundler

Pull QAcloud

-- Navigate where you want to pull the repository and type:
	1. git clone https://github.com/qacloud/qacloud.io.git
	2. cd qacloud.io

Bundle install

-- install all the dependency:
	bundle install

all set, login to QAcloud and use default company qacloud, Click Run button on Dashboard and click "The internet Test"

copy playlist id (sample: ruby playlist.rb <objectID> ) paste it in to the terminal & see the tests running:

#!/usr/bin/env ruby
require 'rubygems'
require 'httparty'
require 'qacloud'
require 'apisatqacloud'
# require 'watir-webdriver'

# get playlistID or playlistID CI id from args::

# playlistID = ARGV[0]
# tokenID = "your token id"


def self.playlist(playlistID,tokenID)

		taskhash = Qacloud.GetFirstTask(playlistID,tokenID)
			if taskhash.code == 500 then 
				#puts "Getting Task ID:"
				taskhash = Qacloud.GetTaskid(playlistID,tokenID)
				playlistID = taskhash["body"]["_id"]
				taskhash = Qacloud.GetFirstTask(playlistID,tokenID)
			end 

# collecting useful variables and values from taskhash:

			$workflow_name =  taskhash["body"]["workflow_name"]
			$workflow_id =  taskhash["body"]["workflow_id"]
			$task_name =  taskhash["body"]["task_name"]
			task_id =  taskhash["body"]["task_id"]
			$var = taskhash["body"]["task_variables"]
			$env = taskhash["body"]["environment"]
			puts "Workflow: #{$workflow_name}"
			$workflow_status = taskhash["body"]["test"]
			puts "Now Starting Task: #{$task_name}"

	begin

		 	if $var.has_key?("path") == true then
		 	  if $var["path"].empty? == false then	
				path = $var["path"]
			  end
			else 
				path = $env["path"]
			end
			require_relative "#{path}"
			dur1 = Time.now
			$task_name

	rescue Exception => e

		puts "Exception occured, Checkpoint should have more info."
		@erro_line = e.backtrace[0].split(":")
		@error_line = @erro_line[1]
		@error_message = "#{$!}"
		@error_line = Integer(@error_line) rescue "ErrorImage"
		dur2 = Time.now
		status = "fail"
		result = "Exception occured, Checkpoint should have more info."
		checkpoint = "Error Message: #{@error_message} , Script Line Number: #{@error_line}"
		duration = dur2 - dur1
		# taskhash = Qacloud.GetNextTask(task_id,tokenID,status,result,checkpoint,duration)
		# $workflow_status = "finished"
		# Take error image:
		# $browser.screenshot.save "#{dirname}/#{@error_line}.png"	
	else
			dur2 = Time.now
			status = $status
			result = $result
			checkpoint = $checkpoint
			duration = dur2 - dur1	

	end

	while $workflow_status !=  "finished"
		    taskhash = Qacloud.GetNextTask(task_id,token_id,status,result,checkpoint,duration)
			$workflow_name =  taskhash["body"]["workflow_name"]
			$workflow_id =  taskhash["body"]["workflow_id"]
			$task_name =  taskhash["body"]["task_name"]
			task_id =  taskhash["body"]["task_id"]
			$var = taskhash["body"]["task_variables"]
			$env = taskhash["body"]["environment"]
			$workflow_status = taskhash["body"]["test"]

	break if $workflow_status == "finished"
				if $add_variable.empty? == true then
				else
				$get_variable.merge!($add_variable)
				end	
				puts "Workflow: #{$workflow_name}"
				puts "Now Starting Task: #{$task_name}"
	begin
		 	if $var.has_key?("path") == true then
		 	  if $var["path"].empty? == false then	
				path = $var["path"]
			  end
			else 
				path = $env["path"]
			end
				require_relative "#{path}"
				dur1 = Time.now
				$task_name
				
	rescue Exception => e
			puts "Exception occured, Checkpoint should have more info."
			@erro_line = e.backtrace[0].split(":")
			@error_line = @erro_line[1]
			@error_message = "#{$!}"
			@error_line = Integer(@error_line) rescue "ErrorImage"
			dur2 = Time.now
			status = "fail"
			result = "Exception occured, Checkpoint should have more info."
			checkpoint = "Error Message: #{@error_message} , Script Line Number: #{@error_line}"
			duration = dur2 - dur1
			# taskhash = Qacloud.GetNextTask(task_id,tokenID,status,result,checkpoint,duration)
			# $workflow_status = "finished"
			# Take error image:
			# $browser.screenshot.save "#{dirname}/#{@error_line}.png"		

		else
			dur2 = Time.now
			status = $status
			result = $result
			checkpoint = $checkpoint
			duration = dur2 - dur1

		end	
	end
end
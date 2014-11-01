#!/usr/bin/env ruby
require 'rubygems'
require 'httparty'
require 'qacloud'




# getting Task id

$task_id = ARGV[0]



class Playlistclass

$variable_search = {}

$workflow_name
$workflow_id
$task_name
$get_variable
$workflow_status = "Not Finished"
task_id = $task_id
$environment
$add_variable = Hash.new
# $resultHash = Hash.new

token_id = "0/Hxy85jkc9ZgSWAmwPFE/kLD60MBwwI6gDmGTHbGNBqt9sOehujaoZA62zccR0r"


taskhash = Qacloud.GetFirstTask(task_id,token_id)
$workflow_name =  taskhash["body"]["workflow_name"]
$mywfk = $workflow_name
puts "Now Starting Workflow: #{$workflow_name}"
$workflow_id =  taskhash["body"]["workflow_id"]
$task_name =  taskhash["body"]["task_name"]
$task_id =  taskhash["body"]["task_id"]
$get_variable = taskhash["body"]["task_variables"]
$environment = taskhash["body"]["environment"]
$workflow_status = taskhash["body"]["test"]
puts "Now Starting Task: #{$task_name}"

duration1 = Time.now

begin

	load $task_name+".rb"

rescue Exception => e


	puts "Exception! while running the Task: #{$task_name}, Check Exception log in checkpoint."
	@erro_line = e.backtrace[0].split(":")
	@error_line = @erro_line[1]
	@error_message = "#{$!}"

	@error_line = Integer(@error_line) rescue "ErrorImage"


	duration2 = Time.now
	status = "fail"
	result = "Exception! while running the Task: #{$task_name}, Check Exception log in checkpoint."
	checkpoint = "Error Message: #{@error_message} , Script Line Number: #{@error_line}"
	duration = duration2 - duration1
	taskhash = Qacloud.GetNextTask(task_id,token_id,status,result,checkpoint,duration)
	$workflow_status = "finished"

	# Take Snap and save it here:
	# pic_fol = $environment["pic_folder"]
	# dir = "#{pic_fol}#{task_id}/1"
	# dirname = File.dirname(dir)
	# puts dirname
	# unless File.directory?(dirname)
 #  		FileUtils.mkdir_p(dirname)
	# end

	# $browser.screenshot.save "#{dirname}/#{@error_line}.png"


	# date = Time.now.strftime("%d/%m/%Y %H:%M")
	# duration_table = duration #* 1000
	# duration_table = Time.at(duration_table).strftime("%M mins : %S Seconds")
	# $resultHash.store("#{$task_name}","#{status}<=#{result}<=#{checkpoint}<=#{date}<=#{duration_table}")

#ensure



end


duration2 = Time.now
status = $status
result = $result
checkpoint = $checkpoint
duration = duration2 - duration1



while $workflow_status !=  "finished"

taskhash = Qacloud.GetNextTask(task_id,token_id,status,result,checkpoint,duration)
$workflow_name =  taskhash["body"]["workflow_name"]
$workflow_id =  taskhash["body"]["workflow_id"]
$task_name =  taskhash["body"]["task_name"]
$task_id =  taskhash["body"]["task_id"]
$get_variable = taskhash["body"]["task_variables"]
$environment = taskhash["body"]["environment"]
$workflow_status = taskhash["body"]["test"]

break if $workflow_status == "finished"
if $add_variable.empty? == true then

else

$get_variable.merge!($add_variable)

end
puts "Now Starting Task: #{$task_name}"
duration1 = Time.now

begin

	load $task_name+".rb"

rescue Exception => e


	puts "Exception! while running the Task: #{$task_name}, Check Exception log in checkpoint."
	@erro_line = e.backtrace[0].split(":")
	@error_line = @erro_line[1]
	@error_message = "#{$!}"

	@error_line = Integer(@error_line) rescue "ErrorImage"

	# if (@error_line.is_a? Integer) == false then

	# 	@error_line = "ErrorImage"

	# end

	#ensure:::

	duration2 = Time.now
	status = "fail"
	result = "Exception! while running the Task: #{$task_name}, Check Exception log in checkpoint."
	checkpoint = "Error Message: #{@error_message} , Script Line Number: #{@error_line}"
	duration = duration2 - duration1
	taskhash = Qacloud.GetNextTask(task_id,token_id,status,result,checkpoint,duration)
	$workflow_status = "finished"

	# Take Snap and save it here:
	# pic_fol = $environment["pic_folder"]
	# dir = "#{pic_fol}#{task_id}/1"
	# dirname = File.dirname(dir)
	# puts dirname
	# unless File.directory?(dirname)
 #  		FileUtils.mkdir_p(dirname)
	# end

	# sleep 2

	# $browser.screenshot.save "#{dirname}/#{@error_line}.png"

	# date = Time.now.strftime("%d/%m/%Y %H:%M")
	# duration_table = duration #* 1000
	# duration_table = Time.at(duration_table).strftime("%M mins : %S Seconds")
	# $resultHash.store("#{$task_name}","#{status}<=#{result}<=#{checkpoint}<=#{date}<=#{duration_table}")

end


duration2 = Time.now
status = $status
result = $result
checkpoint = $checkpoint
duration = duration2 - duration1


end

 # $resultHash
 # load "Table_Generator.rb"
end



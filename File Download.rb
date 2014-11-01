require_relative "Controller"

navigate

link_name = $get_variable["link_name"]

click_link(link_name)

end_session


# send results ::


$status = "pass"
$result = "Test for : #{link_name} Completed."
$checkpoint = "#{$checkpoint_nav}  #{$checkpoint_click_link}"
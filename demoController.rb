require_relative "Controller"

def $task_name
  navigate

  link_name = $var["link_name"]

  click_link(link_name)

  end_session


  # send results ::


  $status = "pass"
  $result = "Test for : #{link_name} Completed."
  $checkpoint = "#{$checkpoint_nav}  #{$checkpoint_click_link}"

end

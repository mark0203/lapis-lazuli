################################################################################
# Copyright <%= config[:year] %> spriteCloud B.V. All rights reserved.
# Generated by LapisLazuli, version <%= config[:lapis_lazuli][:version] %>
# Author: "<%= config[:user] %>" <<%= config[:email] %>>

# precondition_steps.rb is used to define steps that contain multiple steps to come to a certain start of a scenrario.
# For example: "Given the user is logged in" will contain all steps done before logging in

Given(/^the user has searched for "(.*?)" on (.*?)$/) do |query, page|
  # Run step to go to page
  step "the user navigates to #{page}"
  # Run step to search
  step "the user searches for \"#{query}\""

end

Given(/^the user is logged out$/) do
  # In this step we want to make sure that the user is not logged in.
  # If the user is not logged in, then this step does nothing, else it will trigger the logout step.

  # Make this step independent by going to the homepage
  step 'the user navigates to page "home"'

  # Then try clicking the logout button
  begin
    step 'the user clicks on the logout button'
  rescue Exception => e
    # Ignoring the error, since it probably means we're already logged out.
    log.debug "Logout failed, so I should already be logged out: #{e}"
  end

  # And confirm we've successfully logged out
  step 'the page should display as logged out state'
end

Given(/^"(.*?)" is logged in$/) do |user_tag|
  # First, make sure we're not logged into another account
  step 'the user is logged out'
  # Note: This could be more efficient, often you're already logged in with the correct user.
  # So a different solution would be to check if the correct user is already logged in:
  # set_user_data(user_tag)
  # logged_in? = browser.find(
  #          :span => {:text => get_user_data('username')},
  #          :throw => false
  # )
  # if logged_in? skip the rest

  # Then follow the login steps
  step "When \"#{user_tag}\" fills in the login form"

  # And confirm the login was successful
  step 'the page should display as logged in state'
end




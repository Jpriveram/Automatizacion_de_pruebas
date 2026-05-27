Feature: As a QA Automation Engineer
         I want to test the About Us functionality
         so I ensure users can view the promotional video modal correctly

Background:
  Given I browse to the Demoblaze homepage


@about_us @open
Scenario: Verify the About Us modal opens correctly
  When I click the "About us" button in the navigation bar
  Then I should see a modal with the title "About us"


@about_us @video_play
Scenario: Verify the video starts playing when the play button is clicked
  When I click the "About us" button in the navigation bar
  And  I should see a modal with the title "About us"
  When I click the play button inside the video player
  Then the video player control bar should show the pause button
  And  the video current time should be greater than zero seconds


@about_us @close_x
Scenario: Verify the About Us modal closes correctly after clicking the "X" icon
  When I click the "About us" button in the navigation bar
  And  I should see a modal with the title "About us"
  When I click the "x" close icon on the modal header
  Then the modal should no longer be visible


@about_us @close_button
Scenario: Verify the About Us modal closes correctly after clicking the "Close" button
  When I click the "About us" button in the navigation bar
  And  I should see a modal with the title "About us"
  When I click the "Close" button in the modal footer
  Then the modal should no longer be visible


@about_us @close_backdrop
Scenario: Verify the About Us modal closes correctly after clicking outside of it
  When I click the "About us" button in the navigation bar
  And  I should see a modal with the title "About us"
  When I click outside the modal on the backdrop area
  Then the modal should no longer be visible

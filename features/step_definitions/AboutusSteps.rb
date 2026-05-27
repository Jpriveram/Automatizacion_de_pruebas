When('I click the play button inside the video player') do
  find('#example-video > button', visible: true).click
  sleep 1
end

Then('the video player control bar should show the pause button') do
  expect(page).to have_css('button.vjs-play-control.vjs-playing', visible: true)
end

Then('the video current time should be greater than zero seconds') do
  current_time = page.evaluate_script(
    "document.querySelector('#example-video_html5_api') && document.querySelector('#example-video_html5_api').currentTime"
  )
  puts "VIDEO currentTime: #{current_time}s"
  expect(current_time.to_f).to be > 0
end

When('I click the {string} close icon on the modal header') do |_icon_name|
  sleep 0.5
  find('#videoModal > div > div > div.modal-header > button > span', visible: true).click
end

When('I click the {string} button in the modal footer') do |_button_name|
  sleep 0.5
  find('#videoModal > div > div > div.modal-footer > button', visible: true).click
end

When('I click outside the modal on the backdrop area') do
  sleep 0.5
  page.execute_script("document.querySelector('#videoModal').click()")
  expect(page).to have_no_css('#videoModal', visible: true)
end
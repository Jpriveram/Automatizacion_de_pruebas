Given('the first promotional slide should be visible') do
active_image = find('.carousel-item.active img')
expect(active_image[:alt]).to eq('First slide')
end

When('I click the {string} arrow on the carousel') do |direction|
if direction == 'next'
    find('a.carousel-control-next').click
  elsif direction == 'previous'
    find('a.carousel-control-prev').click
  end
  sleep 1
end

When('I click the indicator for slide {int}') do |slide_number|
  index = slide_number - 1
  
  find("li[data-slide-to='#{index}']").click
  
  sleep 1
end

Then('the {string} promotional slide should become visible') do |slide_alt_text|
  
  active_image = find('.carousel-item.active img')
  
  expect(active_image[:alt]).to eq(slide_alt_text)
  
  puts "TEST ONLY: ¡El carrusel mostró exitosamente la imagen: '#{slide_alt_text}'!"
end
# frozen_string_literal: true

Then('Left unit picker value should be {string}') do |value|
  # sleep 3
  actual_picker_text = find_elements(id: 'select_unit_spinner')[0].text

  if actual_picker_text != value
    fail("Expected unit picker value is #{value}, actual value is #{actual_picker_text}")
  end

end

Then('right unit picker value should be {string}') do |value|
  # sleep 3
  # Array quando o id tem mais de um elemento
  array_of_elements = find_elements(id: 'select_unit_spinner')
  actual_picker_text = array_of_elements[1].text

  if actual_picker_text != value
    fail("Expected unit picker value is #{value}, actual value is #{actual_picker_text}")
  end

end

# Para Multiplos parametro com a escrita da feature igual usa-se esse formato
Then(/^Show all button should be (enabled|disabled)$/) do |state|
  button_state = find_element(id: 'btn_show_all').enabled?

  if state == 'enabled'
    if button_state != true
      fail('Expected to be enabled')
    end
  elsif state == 'disabled'
    if button_state != false
      fail('Expected to be disabled')
    end
  end
end

When('I press on clear button') do
  log('clear button is pressed')
end

When('I type {string} on application keyboard') do |target|
  # Para pegar mais de um digito na calculadora
  digits = target.split('')
  digits.each do |num|
    find_element(id: 'keypad').find_element(xpath: "//android.widget.Button[@text='#{num}']").click
  end
end

Then('I should see result as {string}') do |result|
  value = find_element(id: 'target_value').text

  if value != result
    fail("expected value is #{result}, actual value is #{value}")
  end
end

When('I press on add to favorites icon') do
  find_element(id: 'action_add_favorites').click
end

And('I press on favorite conversions') do
  find_element(:uiautomator, 'new UiSelector().text("Favorite conversions")').click
end

Then('I verify {string} added to favorite conversions list') do |unit_type|
  # find_element(:uiautomator, 'new UiSelector().text("Length")')
  item_text = find_element(id: 'favorites_item_hint').text

  if unit_type != item_text
    fail("Cannot find #{unit_type} in Favorite list")
  end
end

When('I press on search icon') do
  find_element(id: 'action_search').click
end

When('I type {string} in search field') do |text|
  find_element(id: 'search_src_text').send_keys(text)
  # sleep 3
end

When('I press return button on soft keyboard') do
  # sleep 3
  Appium::TouchAction.new.tap(x: 0.99, y: 0.99, count: 1).perform
end

Then('I see {string} as a current unit converter') do |current_unit|
  # find_element(:uiautomator, 'new UiSelector().text("Temperature")')
  find_element(id: 'action_bar').find_element(xpath: "//android.widget.TextView[@text='#{current_unit}']")
  # text("#{current_unit}")
end

When('I select {string} from left unit picker') do |value|
  find_elements(id: 'select_unit_spinner')[0].click

  find_in_list(value)
end

When('I select {string} from menu') do |value|
  find_element(xpath: "//android.widget.TextView[@text='#{value}']").click
end

When('I select {string} from right unit picker') do |value|
  find_elements(id: 'select_unit_spinner')[1].click

  find_in_list(value)
end

When('I press on switch units button') do
  find_element(id: 'img_switch').click
end

Then('I should see text {string}') do |value|
  # text_info_history
  find_element(xpath: "//android.widget.TextView[@text='#{value}']")
end

And(/I verify that (\d+) (?:st|nd|rd|th)? result in history list is "([^"]*)"$/) do |index, text|
  parent_element = find_element(id: 'history_conversion_list')
  array_of_elements = parent_element.find_elements(id: 'history_single_line')
  actual_text = array_of_elements[index.to_i - 1].find_element(id: 'history_item_hint').text
  if actual_text != text
    fail("Expected text is #{text}, actual text is #{actual_text}")
  end
end

When('I press delete from history at {int} st row') do |index|
  parent_element = find_element(id: 'history_conversion_list')
  array_of_elements = parent_element.find_elements(id: 'history_single_line')
  array_of_elements[index.to_i - 1].find_element(id: 'deleteIcon').click
end
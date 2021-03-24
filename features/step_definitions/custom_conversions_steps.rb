# frozen_string_literal: true

When('I press on create your first conversion button') do
  find_element(id: 'btn_new_custom_conversion').click
end

When('I type {string} as custom conversion name') do |name|
  sleep 5
  find_element(id: 'edit_custom_conversion_category_name').send_keys(name)
end

When('I press on new unit button') do
  sleep 5
  find_element(id: 'btn_new_custom_unit').click
end

When('I type {string} as unit name') do |unit_name|
  sleep 5
  find_element(id: 'edit_custom_conversion_unit_dtls_name').send_keys(unit_name)
end

When('I type {string} as unit symbol') do |symbol_name|
  find_element(id: 'edit_custom_conversion_unit_dtls_symbol').send_keys(symbol_name)
end

When('I type {string} as unit value') do |value_name|
  find_element(id: 'edit_custom_conversion_unit_dtls_value').send_keys(value_name)
end

When('I press submit checkmark on custom conversions screen') do
  find_element(accessibility_id: 'Confirm').click
end

When('I press on OK button on custom conversions screen') do
  sleep 5
  find_element(id: 'btn_custom_conversion_details_ok').click
end

Then('I verify {string} added to custom conversions list') do |conversion_name|
  sleep 5
  find_element(xpath: "//android.widget.TextView[@text='#{conversion_name}']")
end
# frozen_string_literal: true

Given('I land on home screen') do
  find_element(id: 'action_search')
  find_element(id: 'action_add_favorites')
  # puts => depreciado nessa versão do cucumber
end

When('I press on Menu icon') do
  find_element(accessibility_id: 'Open navigation drawer').click
end

Then('I should see left side menu') do
  find_element(:uiautomator, 'new UiSelector().text("Unit Converter")')
end

When('I press on my conversions button') do
  find_element(xpath: '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout[2]/android.support.v4.widget.DrawerLayout/android.widget.ListView/android.widget.RelativeLayout[3]/android.widget.RelativeLayout/android.widget.RelativeLayout/android.widget.TextView').click
end

Then('I land on my conversions screen') do
  find_element(id: 'text_info_no_custom_conversions')
end

# frozen_string_literal: true

When(/^I swipe from left to right$/) do
  Appium::TouchAction.new.swipe(start_x: 0.01, start_y: 0.3, end_x: 0.8, end_y: 0.35, duration: 600).perform
end

When(/^I swipe from right to left$/) do
  Appium::TouchAction.new.swipe(start_x: 0.8, start_y: 0.3, end_x: 0.01, end_y: 0.35, duration: 600).perform
end

When(/^I swipe from right to left for calculator$/) do
  Appium::TouchAction.new.swipe(start_x: 0.99, start_y: 0.3, end_x: 0.01, end_y: 0.35, duration: 600).perform
end

When(/^I swipe from left to right for calculator$/) do
  Appium::TouchAction.new.swipe(start_x: 0.08, start_y: 0.3, end_x: 0.8, end_y: 0.35, duration: 600).perform
end
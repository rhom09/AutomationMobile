# frozen_string_literal: true

Before do
    $driver.start_driver
end

After do |scenario|
  if scenario.failed?
    if !File.directory?('screenshots')
      FileUtils.mkdir_p('screenshot')
    end

    time_stamp = Time.now.strftime('%d-%m-%Y_%H-%M-%S')
    screenshot_name = time_stamp + '.png'
    screenshot_file = File.join('screenshots', screenshot_name)
    $driver.screenshot(screenshot_file)
    embed("#{screenshot_file}", 'image/png')
  end
    $driver.driver_quit
end

AfterConfiguration do
  FileUtils.rm_r('screenshots') if File.directory?('screenshots')
end

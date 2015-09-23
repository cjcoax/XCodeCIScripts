require 'fileutils'

def ipa_path
 File.join(ENV['XCS_OUTPUT_DIR'], ENV['BC_PRODUCT_NAME']) + ".ipa"
end

def bot_name
  ENV['XCS_BOT_NAME']
end


def product_name
  ENV['BC_PRODUCT_NAME']
end

def hockey_token
  ENV['BC_HOCKEY_TOKEN']
end

def dsym_path_before_zip
  File.join(ENV['XCS_ARCHIVE'], 'dSYMs', "#{product_name}.app.dSYM")
end

puts bot_name
puts ipa_path 
puts hockey_token
puts dsym_path_before_zip
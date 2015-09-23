require 'fileutils'

def ipa_path
 File.join(ENV['XCS_OUTPUT_DIR'], ENV['BC_PRODUCT_NAME']) + ".ipa"
end

print ipa_path 


def bot_name
  ENV['XCS_BOT_NAME']
end

def product_name
  ENV['CMD_PRODUCT_NAME']
end



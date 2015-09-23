require 'fileutils'

print ENV['BC_PRODUCT_NAME']

def ipa_path
 File.join(ENV['XCS_OUTPUT_DIR'], ENV['BC_PRODUCT_NAME'])
end

print ipa_path 
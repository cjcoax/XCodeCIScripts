require 'fileutils'

def ipa_base_path
	"/Library/Developer/XcodeServer/IntegrationAssets"
end

def bot_id 
	ENV['XCS_BOT_ID']
end

def bot_name
	ENV['XCS_BOT_NAME']
end

def product_name
	ENV['BC_PRODUCT_NAME']
end


def ipa_bot_path
	bot_id + "-" + bot_name
end

def ipa_name
	product_name + ".ipa"
end


def bot_number 
	ENV['XCS_INTEGRATION_NUMBER']
end

def ipa_path
 File.join(ipa_base_path, ipa_bot_path,bot_number ,ipa_name)
end

puts File.file?(ipa_path)
puts ipa_path


def hockey_token
  ENV['BC_HOCKEY_TOKEN']
end

# def dsym_path_before_zip
#   File.join(ENV['XCS_ARCHIVE'], 'dSYMs', "#{product_name}.app.dSYM")
# end

# def dsym_path_after_zip
#   File.join('/tmp', "#{bot_name}.dsym.zip")
# end

# def zip_dsym
#   FileUtils.rm_f(dsym_path_after_zip)
#   system("/usr/bin/zip -r \"#{dsym_path_after_zip}\" \"#{dsym_path_before_zip}\"")
# end

# puts File.file?(ipa_path)
# puts ipa_path
# puts "zip_dsym = " + zip_dsym

def curl_command
  command = [
    '/usr/bin/curl',
    '-F status=2',
    '-F notify=0',
    "-F ipa=@\"#{ipa_path}\"",
    # "-F dsym=@\"#{dsym_path_after_zip}\"",
    "-H \"X-HockeyAppToken: #{hockey_token}\"",
    'https://rink.hockeyapp.net/api/2/apps/upload'
  ]
  command.join(" ")
end


def upload
  system(curl_command)
end

raise 'Unable to create dsym.zip.' unless zip_dsym
raise 'Upload failed.' unless upload


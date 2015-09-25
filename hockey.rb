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
	ENV['XCS_INTEGRATION_NUMBER'].to_s
end

def previous_bot_number_int 
	ENV['XCS_INTEGRATION_NUMBER'].to_i - 1
end

def ipa_path
	File.join(ipa_base_path, ipa_bot_path,bot_number ,ipa_name)
end

# puts File.file?(ipa_path)
# puts ipa_path


def hockey_token
  ENV['BC_HOCKEY_TOKEN']
end

 puts previous_bot_number_int
 # puts "previous bot:" + File.directory?(File.join(ipa_base_path, ipa_bot_path,(bot_number_int - 1).to_s))
 puts File.directory?(File.join(ipa_base_path, ipa_bot_path,bot_number))





puts "here"

def curl_command
  command = [
    '/usr/bin/curl',
    '-F status=2',
    '-F notify=0',
    "-F ipa=@\"#{ipa_path}\"",
    



    "-H \"X-HockeyAppToken: #{hockey_token}\"",
    'https://rink.hockeyapp.net/api/2/apps/upload'
  ]
  command.join(" ")
end


def upload
  system(curl_command)
end






raise 'Upload failed.' unless upload


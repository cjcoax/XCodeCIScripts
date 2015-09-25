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

def ipa_path
	File.join(ipa_base_path, ipa_bot_path,bot_number,ipa_name)
end

puts ipa_path
puts File.file?(ipa_path)


def hockey_token
  ENV['BC_HOCKEY_TOKEN']
end


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


sleep 40
def upload
  system(curl_command)
end






raise 'Upload failed.' unless upload


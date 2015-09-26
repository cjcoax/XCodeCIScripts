require 'fileutils'

def ipa_base_path
	"/Library/Developer/XcodeServer/IntegrationAssets"
	# "/Users/amirrezvani/Downloads"
end


def bot_id 
	"b6cf942fdcb99933f997be8381009090"
end

def bot_name
	"XcodeCITest_CI Bot"
end

def product_name
	"XcodeCITest_CI"
end


def ipa_bot_path
	bot_id + "-" + bot_name
end

def ipa_name
	product_name + ".ipa"
end

def bot_number 
	27.to_s
end


def ipa_path
	File.join(ipa_base_path, ipa_bot_path,bot_number ,ipa_name)
end


puts ipa_path


def hockey_token
	"0b8774d2211745089d86dcb460a88085"
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

def upload
  system(curl_command)
end

raise 'Upload failed.' unless upload
require 'fileutils'

def ipa_base_path
  "/Library/Developer/XcodeServer/IntegrationAssets/b6cf942fdcb99933f997be8381009090-XcodeCITest_CI Bot/81"
end

def exported_product_path 
  "ExportedProduct/Apps"
end


def bot_id 
  81
end

def product_name
  "XcodeCITest_CI"
end

def ipa_name
  product_name + ".ipa"
end


def bot_number 
  "81"
end

def ipa_path
  # File.join(ipa_base_path, ipa_bot_path,bot_number,ipa_name)
  File.join(ipa_base_path,ipa_name)
end



def hockey_token
  "0b8774d2211745089d86dcb460a88085"
end


puts ipa_path
puts File.file?(ipa_path)
puts bot_number

def curl_command

  command = [
    '/usr/bin/curl',
    '-F status=2',
    '-F notify=0',
    "-F ipa=@\"#{ipa_path}\"",
    '-F notify=2',
    "-F mandatory=\"#{bot_number}\"",


    "-H \"X-HockeyAppToken: #{hockey_token}\"",
    'https://rink.hockeyapp.net/api/2/apps/upload'
  ]
  command.join(" ")
end


def upload
  system(curl_command)
end






raise 'Upload failed.' unless upload


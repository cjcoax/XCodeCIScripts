require 'fileutils'

puts "start"

def ipa_base_path
  ENV['XCS_OUTPUT_DIR']
end

def exported_product_path 
  "ExportedProduct/Apps"
end

def product_name
  ENV['BC_PRODUCT_NAME']
end

def ipa_name
  product_name + ".ipa"
end


# def bot_number 
#   ENV['XCS_INTEGRATION_NUMBER'].to_s
# end

def ipa_path
  File.join(ipa_base_path, exported_product_path,ipa_name)
end



def hockey_token
  ENV['BC_HOCKEY_TOKEN']
end


#notes for hockey app
def base_source_dir
  ENV['XCS_SOURCE_DIR']
end

def info_plist_sub_path
  ENV['BC_INFO_PLIST_SUB_PATH']
end

def info_plist_path
  File.join(base_source_dir, info_plist_sub_path) 
end


def branch_name
  #exec("git rev-parse --abbrev-ref HEAD")
  ENV["BC_BRANCH_NAME"]
end

# def app_version
#   exec("/usr/libexec/PlistBuddy -c 'print:CFBundleVersion' '#{info_plist_path}'")
# end

# puts app_version

puts info_plist_path

def hockey_app_notes
    "Branch: " + branch_name #+ ", Version: " + app_version 
end

puts hockey_app_notes




def curl_command

  command = [
    '/usr/bin/curl',
    '-F status=2',
    '-F notify=0',
    '-F notes_type=0',
    "-F notes=\"#{hockey_app_notes}\"",
    "-F ipa=@\"#{ipa_path}\"",
    '-F notify=2',
    '-F mandatory=1',


    "-H \"X-HockeyAppToken: #{hockey_token}\"",
    'https://rink.hockeyapp.net/api/2/apps/upload'
  ]
  command.join(" ")
end


def upload
  system(curl_command)
end






raise 'Upload failed.' unless upload


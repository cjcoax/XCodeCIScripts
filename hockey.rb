require 'fileutils'
require 'plist'


def ipa_base_path
  ENV['XCS_OUTPUT_DIR']
end

puts "ipa_base_path " + ipa_base_path


def exported_product_path 
  "ExportedProduct/Apps"
end


puts "exported_product_path " + exported_product_path

def product_name
  ENV['BC_PRODUCT_NAME']
end

puts "product_name " + product_name

def ipa_name
  product_name + ".ipa"
end


puts "ipa_name "+ ipa_name

def bot_number 
  ENV['XCS_INTEGRATION_NUMBER'].to_s
end


puts "bot_number "+ bot_number

def ipa_path
  File.join(ipa_base_path, exported_product_path,ipa_name)
end


puts "ipa_path "+ ipa_path

def hockey_token
  ENV['BC_HOCKEY_TOKEN']
end


puts "hockey_token "+ hockey_token

#notes for hockey app
def base_source_dir
  ENV['XCS_SOURCE_DIR']
end

puts "base_source_dir "+ base_source_dir

def info_plist_sub_path
  ENV['BC_INFO_PLIST_SUB_PATH']
end

puts "info_plist_sub_path "+ info_plist_sub_path


def info_plist_path
  File.join(base_source_dir, info_plist_sub_path) 
end


puts "info_plist_path "+ info_plist_path

def branch_name
  ENV["BC_BRANCH_NAME"]
end


puts "branch_name " + branch_name


def info_plist
  Plist::parse_xml("#{info_plist_path}")
end


def format_plist(plistArr)
  for element in plistArr
    puts element
  end
end




puts "info_plist"
format_plist(info_plist)

def app_version
  info_plist["CFBundleShortVersionString"]  
end

puts "app_version " + app_version

def build_version
  info_plist["CFBundleVersion"]
end

puts "build_version "+ build_version


def hockey_app_notes
    "Branch: " + branch_name + ", Version: " + app_version + ", Build Number: " + build_version
end

puts "hockey_app_notes "+ hockey_app_notes


puts "************ Uploading to Hockey App ************"


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


require 'fileutils'
require 'plist'

def base_source_dir
	ENV['XCS_SOURCE_DIR']
end


def info_plist_sub_path
	ENV['BC_INFO_PLIST_SUB_PATH']
end


def info_plist_path
	File.join(base_source_dir, info_plist_sub_path) 
end


def bot_number
	ENV['XCS_INTEGRATION_NUMBER']
end


def info_plist
  Plist::parse_xml("#{info_plist_path}")
end


def app_version
  info_plist["CFBundleShortVersionString"]  
end


def now
  DateTime.now.strftime('%s').to_i/60
end


def timestamped_app_version
  	now.to_s + app_version
end

def timestamped_build_version
	now.to_s + bot_number
end

def version_command
	command = ["/usr/libexec/PlistBuddy -c 'Set CFBundleShortVersionString #{timestamped_app_version}' '#{info_plist_path}'",
		";",
		"/usr/libexec/PlistBuddy -c 'Set CFBundleVersion #{timestamped_build_version}' '#{info_plist_path}'"
	]
	command.join(" ")
end

exec(version_command)








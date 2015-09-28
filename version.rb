require 'fileutils'


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
	"8"
end


def version_command
	"/usr/libexec/PlistBuddy -c 'Set CFBundleShortVersionString #{bot_number}' '#{info_plist_path}'"
end


exec(version_command)








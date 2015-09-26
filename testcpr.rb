require 'fileutils'

# FileUtils.cp_r(Dir[
# '/Library/Developer/XcodeServer/IntegrationAssets/b6cf942fdcb99933f997be8381009090-XcodeCITest_CI Bot/35/*'
# #'/Users/amirrezvani/Documents/Books/Iran High School Math/*'
# ], '/Users/amirrezvani/Downloads/35')


def file_path
	"/Library/Developer/XcodeServer/IntegrationAssets/b6cf942fdcb99933f997be8381009090-XcodeCITest_CI Bot/56/XcodeCITest_CI.ipa"#File.join("/Library/Developer/XcodeServer/IntegrationAssets/b6cf942fdcb99933f997be8381009090-XcodeCITest_CI Bot","55","XcodeCITest_CI.ipa") #+ "XcodeCITest_CI.ipa"
end

puts file_path
puts File.file?(file_path)



# def sleep_one_sec
# 	sleep 10
# end
sleep 10
puts "here"




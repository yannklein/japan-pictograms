require 'fileutils'

def picto_rename
  base_pictos = Dir['./pictos/*.svg']
  dest_folder = './pictos_standardized/'
  FileUtils.rm_rf(dest_folder)
  FileUtils.mkdir(dest_folder)
  base_pictos.each do |picto|
    filename = File.basename(picto, File.extname(picto))
    FileUtils.cp(picto, dest_folder + "/" + filename.tr(" _", "-").downcase + File.extname(picto))
  end
end

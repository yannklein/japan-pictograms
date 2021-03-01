require 'fileutils'

def picto_rename
  base_pictos = Dir['./fonts/*.svg']
  dest_folder = './pictos_standardized/'
  FileUtils.rm_rf(dest_folder)
  FileUtils.mkdir(dest_folder)
  base_pictos.each do |picto|
    filename = File.basename(picto, File.extname(picto))
    renamed_filename = (filename.tr(' _', '-').downcase)[2..-1]
    FileUtils.cp(picto, dest_folder + '/' + renamed_filename + File.extname(picto))
  end
end

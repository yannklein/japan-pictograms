require_relative 'scripts/generate.rb'
require_relative 'scripts/picto_rename.rb'

task :generate do
  generate('fonts/fonticon.svg', 'japan-pictograms.css.erb', 'japan-pictograms.css')
  generate('fonts/fonticon.svg', 'index.html.erb', 'index.html')
end

task :rename_picto do
  picto_rename
end

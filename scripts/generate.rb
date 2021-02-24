require 'erb'
require 'json'
require 'ostruct'
require 'date'

def generate(picto_path, template_path, output_path)
  template = File.read(template_path)
  picto_paths = Dir.entries(picto_path).reject { |entry| ['..', '.'].include?(entry) }
  pictos = picto_paths.map do |path|
    { name: path.gsub(/(\w_|.svg)/, '').downcase, path: path }
  end
  pictos_hash = { root: picto_path, pictos: pictos }
  generated = ERB.new(template).result(pictos_hash.instance_eval { binding })
  File.write(output_path, generated)
end

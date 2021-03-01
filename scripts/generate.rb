require 'erb'
require 'json'
require 'ostruct'
require 'date'
require 'nokogiri'
require 'open-uri'


def generate(picto_path, template_path, output_path)
  svg_doc = Nokogiri::HTML open(picto_path)
  template = File.read(template_path)
  # picto_paths = Dir.entries(picto_path).reject { |entry| ['..', '.'].include?(entry) }
  pictos = []
  svg_doc.css('glyph').each do |glyph|
    next if glyph.attribute('glyph-name').nil? || glyph.attribute('unicode').nil?

    name = glyph.attribute('glyph-name').value
    unicode = glyph.attribute('unicode').value
    pictos << { name: name, unicode: unicode }
  end
  generated = ERB.new(template, nil, '-').result(pictos.instance_eval { binding })
  File.write(output_path, generated)
end

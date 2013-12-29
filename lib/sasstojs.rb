# Custom SASS extension to provide a way to output
# some SASS variable settings to a javascript file.
# You can then use this in your javascript.

require 'compass'
require 'json'

extension_path = File.expand_path(File.join(File.dirname(__FILE__), ".."))
Compass::Frameworks.register('sasstojs', :path => extension_path)

module Sasstojs
  VERSION = "1.0"
  DATE = "2013-12-28"
end

module Sass::Script::Functions
  #collections
  @@filename = "css.settings.js"
  @@varname = "cssSettings"
  @@variables = {}

  # converts from Sass objects to ruby
  def convert_value(value)
    newvalue = value.value

    if newvalue == nil
      newvalue = value.to_s
    end

    # puts "#{value.class}"
    if newvalue.is_a?(Array)
      newvalue = newvalue.map { |v| convert_value(v) }
    elsif newvalue.is_a?(Hash)
      newvalue = Hash[newvalue.map { |k, v| [k, convert_value(v)] }]
    end

    return newvalue
  end

  def js_config(filename = "css.settings.js", varname = "cssSettings")
    @@filename = filename.value
    @@varname = varname.value
    return Sass::Script::String.new("")
  end
  declare :js_config, [:filename, :varname]

  def js_add(name, value)
    @@variables[name.value] = convert_value(value)
    return Sass::Script::String.new("")
  end
  declare :js_add, [:name, :value]

  def make_js_variable(name, value)
    "var " + name.to_s + " = " + value + ";\n"    
  end

  # write json to style file
  def js_write
    output = make_js_variable(@@varname, JSON.pretty_generate(@@variables))

    File.open(File.join(Compass.configuration.project_path, Compass.configuration.javascripts_dir, @@filename), "w") do |f|
      f.write(output)
    end

    @@variable = ''

    return Sass::Script::String.new('')
  end
  declare :js_write, []
end

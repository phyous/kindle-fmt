#!/usr/bin/env ruby
require 'rubygems'
require 'clipboard'

###
# Character mappings for kindle copy paste errors
@xml_map = {
    /[ ]*="[ ]*/ => "=\"",
    /[ ]*"/ => "\"",
    /[ ]*<\?[ ]*/ => "<?",
    /[ ]*<[ ]*/ => "<",
    /[ ]*>[ ]*/ => ">\n",
    /[ ]*<\/[ ]*/ => "</"
}

@java_map = {
  /;/ => ";\n",
  /\s*\(\s*/ => "(",
  /\s*\)\s*/ => ")",
  /\s*\{/ => " {\n",
  /\}/ => "\n}"
}

@fmt_maps = {
  "xml" => @xml_map,
  "java" => @java_map,
  "default" => @java_map
}

# Determine appropriate map to use for character replacement.
# Default to java if unable to detect or if no command line args passed
def determine_map(str)
  char_based_map = str[0] == "<" ? "xml" : "default"
  @fmt_maps[ARGV[0]] || @fmt_maps[char_based_map]
end

#----
# Script

# 1- Get clipboard contents & drop everything except first line (junk added by kindle)
pasted = Clipboard.paste.split("\n").first
# 2- Determine appropriate
map = determine_map(pasted)

# 3- Apply mappings
map.each_pair do |k,v|
  pasted.gsub!(k,v)
end

# 4- Print to console
puts pasted
Clipboard.copy(pasted)
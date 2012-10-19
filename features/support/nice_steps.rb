def full_line line
  /^#{line}$/
end

def regex str
  str.gsub!(/\(/, '(?:')
  str.gsub!(/\*/, '(.*?)')
  str.sub!(/\.\.\.$/, '.*')
  full_line str
end

def Step step, &block
  When regex(step), &block
end
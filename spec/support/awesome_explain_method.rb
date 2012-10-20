# require 'rspec_outlines'
# module Helpers
#   def explain_method method, table
#     context "##{method}" do
#       outline ":input -> :output" do
#         subject.send(method, input).should == output
#       end
#       fields :input, :output
#       table.each_slice(2).each { |params| values *params }
#     end
#     end
#   end
# end 


module Helpers
  def explain_method method, table
    context "##{method}" do
      table = table.each_slice(2)
      table.each do |inputs, outputs| # 's mean string
        input = prepare inputs
        output = prepare outputs

        specify table(inputs, outputs, table) do
          subject.send(method, input).should == output
        end
      end
    end
  end
  
  private
  def table(input, output, table)
    '( %s  =>  %s )' % [ field(input, table.map{|x|x[0]}), field(output, table.map{|x|x[1]}) ]
  end
  def field text, column
    text.center column.map(&:size).max
  end
  def prepare param
    param =~ /^`.+`$/ ? eval(param[1..-2]) : param
  end
end

RSpec.configure do |config|
  config.extend Helpers
end
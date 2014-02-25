require 'sinatra'
require 'ascii_paint'
require 'pry'

def outfile
  "#{Process.pid}-#{Thread.current.object_id}-painting.png"
end

get '/paint' do
  AsciiPaint.paint(params['ascii'], outfile)
  path = Dir.pwd + '/' + outfile
  send_file path
end

get '/block_letters' do
  AsciiPaint.block_paint(params['letters'], outfile)
  path = Dir.pwd + '/' + outfile
  send_file path
end

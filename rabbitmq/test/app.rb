require 'dotenv'
Dotenv.load('../.env')

require 'time'
require 'bunny'
require_relative 'connection'
require_relative 'wait'

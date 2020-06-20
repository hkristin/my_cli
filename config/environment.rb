require "rubygems"
require "pry"
require "dotenv"
require "rest-client"
require "json"
require "colorize"

Dotenv.load

require_relative "../lib/my_cli/version"
require_relative "../lib/candidate.rb"
require_relative "../lib/election.rb"
require_relative "../lib/civic_info_api.rb"
require_relative "../lib/my_cli.rb"
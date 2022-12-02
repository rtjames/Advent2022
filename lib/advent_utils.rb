# frozen_string_literal: true

require 'pathname'

DATA_FOLDER = '../data'

def get_input_path(filename)
  Pathname.getwd.join(__dir__).join(DATA_FOLDER).join(filename).to_s
end

def get_input_file(filename)
  File.open(get_input_path(filename), 'r')
end

#require 'etherpad/acts_as_pad'

#ETHERPAD_SERVER_PATH = 'http://localhost:9000'

class ActiveRecord::Base
  extend Etherpad
end
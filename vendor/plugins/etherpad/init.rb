
# run etherpad
run_ep_cmd = "cd #{RAILS_ROOT}/vendor/plugins/etherpad/lib/etherpad_app/etherpad; bin/run-local.sh"
exec(run_ep_cmd) if fork.nil?

class ActiveRecord::Base
  extend Etherpad
end
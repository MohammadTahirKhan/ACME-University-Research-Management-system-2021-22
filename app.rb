require "sinatra"
require "require_all"

enable :sessions
set :session_secret, "$g]Rd2M/WbJ`~~<GZWdH@Fm'ESk2_gckCtLJJkySYG"

set :bind, '0.0.0.0'

include ERB::Util
require_rel "db/db", "models", "controllers"


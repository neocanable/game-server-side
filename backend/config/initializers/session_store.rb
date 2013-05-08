# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_demo_session',
  :secret      => '4d71d9dc3dc4e7b3e3f82aae74befd5412e6ceb30cdd073adf9db71ba70bf6f8c2427ff28314d4cda650adeda0a85307dc0aa963ed99d28514febcc322015b32'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

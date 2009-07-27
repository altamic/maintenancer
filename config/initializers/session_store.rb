# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_maintenance_session',
  :secret      => 'd71fd76df7e259f250425a7bb31b5ac7465172e4545bba21ef70b19e8ada1b409d624690b477ca3e0cb454618fe6a6e4110be8eec22b6f6c9dd992a86e8d6ee2'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

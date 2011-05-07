# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_hello-operator_session',
  :secret      => '9477949e4c24df41b3c6bb89b451624d17d0141d5fb71869f1225fa0e3a978d7d180be8908309046614a0e6d39571b42e2a28bba02088c280bdff1ff422cd3be'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

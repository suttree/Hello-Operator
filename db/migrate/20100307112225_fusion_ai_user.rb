class FusionAiUser < ActiveRecord::Migration
  def self.up
    execute( "INSERT INTO users (login, persistence_token, perishable_token, crypted_password, password_salt) VALUES ('FusionAI', '-', '-', '-', '-')")
  end

  def self.down
    execute( "DELETE FROM users WHERE login = 'fusion-ai'")
  end
end

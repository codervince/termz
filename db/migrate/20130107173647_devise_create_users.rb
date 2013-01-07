class DeviseCreateUsers < ActiveRecord::Migration
  def self.up

     change_table(:users) do |t|

      #ONLY NAME IS KEPT FROM ORIGINAL MODEL

      ## Database authenticatable

      t.change(:email, :string, :null => false, :default => "")
      t.remove :password_hash, :password_digest
      t.remove :guest
      t.remove :remember_token
      t.rename :locale_id, :set_language_id

      t.string :encrypted_password, :null => false, :default => ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, :default => 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, :default => 0 # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      ## Token authenticatable
      # t.string :authentication_token


    end

    add_index :users, :reset_password_token, :unique => true
    add_index :users, :confirmation_token,   :unique => true
    # add_index :users, :unlock_token,         :unique => true
    # add_index :users, :authentication_token, :unique => true
  end

  def self.down
     change_table(:users) do |t|

        t.change(:email, :string)
        t.string :password_hash, :password_digest
        t.boolean :guest
        t.string :remember_token
         
        t.rename :set_language_id, :locale_id

        t.remove :encrypted_password

        t.remove :reset_password_token
        t.remove :reset_password_sent_at

        t.remove :remember_created_at

        t.remove :sign_in_count
        t.remove :current_sign_in_at
        t.remove :last_sign_in_at
        t.remove :current_sign_in_ip
        t.remove :last_sign_in_ip

        t.remove :confirmation_token
        t.remove :confirmed_at
        t.remove :confirmation_sent_at
        t.remove :unconfirmed_email

     end
     add_index  :users, :remember_token

  end  



end

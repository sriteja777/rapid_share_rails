def password_requirements
    rules = {
        "should be atleast 8 characters" => /.{8,}/,
      " must contain at least one lowercase letter"  => /[a-z]+/,
      " must contain at least one uppercase letter"  => /[A-Z]+/,
      " must contain at least one digit"             => /\d+/,      
    }
  
    rules.each do |message, regex|
      errors.add( :password, message ) unless password.match( regex )
    end
  end

class User < ApplicationRecord
    PASSWORD_FORMAT = /\A
        (?=.{8,})          # Must contain 8 or more characters
        (?=.*\d)           # Must contain a digit
        (?=.*[a-z])        # Must contain a lower case character
        (?=.*[A-Z])        # Must contain an upper case character
    /x

    has_many :documents, -> { order('created_at DESC') }
    validates :username, presence: true, uniqueness: true
    validate :password_requirements
    # validates :password, presence: true, length: { minimum: 8 }, format: { with: PASSWORD_FORMAT }   

    def authenticate(given_password)
        puts " password -  #{password} username - #{username}"
        password == given_password
    end
end

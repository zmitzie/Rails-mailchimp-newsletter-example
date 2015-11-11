class Newsletter < ActiveRecord::Base
  before_save :mailchimp
  validates :first_name, presence: true, length: { minimum: 3, maximum: 32 }
  validates :last_name, presence: true, length: { minimum: 3, maximum: 32 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, 
    presence: true,
    length: {minimum: 3, maximum: 255},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
    
  protected
    
    def mailchimp
      mailchimp = Mailchimp::API.new("6c1991e9312556e0235c650b9e4ef48c-us12")
      mailchimp.lists.subscribe("4de1b79f01",
                               { email: self.email },
                               { 'FNAME' => self.first_name, 'LNAME' => self.last_name })
    end
end

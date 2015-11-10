class Newsletter < ActiveRecord::Base
  before_save :mailchimp
  
  protected
    
    def mailchimp
      mailchimp = Mailchimp::API.new("6c1991e9312556e0235c650b9e4ef48c-us12")
      mailchimp.lists.subscribe("4de1b79f01",
                               { email: self.email },
                               { 'FNAME' => self.first_name, 'LNAME' => self.last_name })
    end
end

class Notifier < ActionMailer::Base  
  
  def client_password_reset_instructions(config, client)
    subject       "Password Reset Instructions - #{config.company_name}"
    from          config.company_email
    recipients    client.email
    sent_on       Time.now
    body          :config => config, :edit_client_password_reset_url => edit_client_client_password_reset_url(client.perishable_token)
  end
  
  def client_invite(config, client, custom_message)
    subject       "#{config.company_name} - Your Photos are Ready!"
    from          config.company_email
    recipients    client.email
    sent_on       Time.now
    body          :config => config, :custom_message => custom_message, :edit_client_password_reset_url => edit_client_client_password_reset_url(client.perishable_token)
  end
  
  def photographer_password_reset_instructions(photographer)
    subject       "Password Reset Instructions - #{photographer.company_name}"
    from          photographer.company_email
    recipients    photographer.email
    sent_on       Time.now
    body          :edit_photographer_password_reset_url => edit_admin_photographer_password_reset_url(photographer.perishable_token)
  end
  
  def photographer_welcome(photographer, unencrypted_password)
    subject       "Welcome - #{photographer.company_name}"
    from          photographer.company_email
    recipients    photographer.email
    sent_on       Time.now
    body          :admin => admin_url, :email => photographer.email, :unencrypted_password => unencrypted_password
  end
  
end
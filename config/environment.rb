
# Load the rails application
require File.expand_path('../application', __FILE__)
require File.join( Rails.root.to_s, 'config', 'html_template' )
HtmlTemplate.generate_template_files
# Initialize the rails application
Signature::Application.initialize!

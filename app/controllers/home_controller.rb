class HomeController < ApplicationController

  def index
    @temp_files = []
    Dir.glob( File.join( Rails.root.to_s , 'public' ,'templates', 'sign_*', "*.html.erb") ).each do |template|
      @temp_files << template
    end
  end

end

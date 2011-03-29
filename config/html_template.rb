module HtmlTemplate
  def self.generate_template_files
     Dir.glob( File.join( Rails.root.to_s , 'public' ,'templates', 'sign_*') ).each do |template|
      filename = template.gsub(File.dirname(template)+"/","")
      css_file = File.join(template, "#{filename}.css")
      html = File.join( Rails.root.to_s , 'public' ,'templates', 'template.html.erb')
      # if the output CSS file doesn't exist, or the the input CSS file is newer than the output CSS file:
      if (File.exists?(css_file))
        # now read the html and css and generate inline html file
        premailer = Premailer.new(html, :css => css_file)
        
        # Write the HTML output
       fout = File.open("#{template}/#{filename}.html.erb", "w")
       fout.puts premailer.to_inline_css
       fout.close
        
      end # if ..
    end
  end
end

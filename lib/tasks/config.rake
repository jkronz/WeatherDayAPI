namespace :app do
  desc 'copy the example files to the real config locations'
  task :config do
    Dir.glob('config/**/*.example').each do |original|
      replacement = original.gsub(".example", "")
      FileUtils.cp(original, replacement)
      puts "Created #{replacement}"
    end
  end
end

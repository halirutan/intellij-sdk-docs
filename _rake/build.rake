desc 'Build docs'
task :build do
  dest = ENV['dest'] || CONFIG[:build_destination]

  Rake::Task['build_toc'].invoke
  Rake::Task['build_ui_config'].invoke

  command = "jekyll build --trace --destination=#{dest} --config _config.yml,_config_prod.yml"
  sh command
end
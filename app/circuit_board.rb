class CircuitBoard < Sinatra::Base
  # common settings
  set :public_folder, "#{settings.root}/public"

  # sprockets settings
  set :environment, Sprockets::Environment.new
  
  environment.append_path "#{settings.root}/assets/stylesheets"
  environment.append_path "#{settings.root}/assets/javascripts"
  
  environment.css_compressor = :scss
  environment.js_compressor  = Closure::Compiler.new(language_in: 'ECMASCRIPT_2017')

  # serve compiled assets
  get "/assets/*" do
    env["PATH_INFO"].sub!("/assets", "")
    settings.environment.call(env)
  end

  # register controllers
  [
    BillsController
  ].each do |ctrl|
    use ctrl
    ctrl.views = "#{settings.root}/views"
  end
end

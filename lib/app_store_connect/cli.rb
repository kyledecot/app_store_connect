require "gli"

require "app_store_connect/version"

module AppStoreConnect
  class CLI
    extend GLI::App

    program_desc "Here is my program description"
    version AppStoreConnect::VERSION

    flag [:i, :issuer_id], :default_value => ENV["ISSUER_ID"]
    flag [:p, :private_key_path], :default_value => ENV["PRIVATE_KEY_PATH"]
    flag [:k, :key_id], :default_value => ENV["KEY_ID"]

    command "app" do |c|
      c.action do |_, _, args|
        app_id = args.first
       puts client.app(app_id).to_json
      end
    end

    command "apps" do |c|
      c.desc "Gets all of the apps"
      c.long_desc "The long desc"

      c.action do |global_options, _,_|
        puts client(global_options).apps.to_json
      end
    end

    command "builds" do |c|
      c.flag [:a, :app_id]

      c.action do |global_options, options|
        app_id = options[:app_id]

        puts client(global_options).builds(app_id).to_json
      end
    end

    command "build" do |c|
      c.switch [:a, :app_id]
      c.switch [:b, :build_id]

      c.action do |global_options, options|
        app_id = options[:app_id]
        build_id = options[:build_id]

        puts client(global_options).build(app_id, build_id).to_json
      end
    end

    private

    def self.client(global_options)
      AppStoreConnect::Client.new(
        :private_key_path => global_options[:private_key_path],
        :issuer_id => global_options[:issuer_id],
        :key_id => global_options[:key_id]
      )
    end
  end
end

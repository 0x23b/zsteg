$:.unshift(File.expand_path("../lib", File.dirname(__FILE__)))
require 'zsteg'
require 'zsteg/cli'

SAMPLES_DIR = File.expand_path("../samples", File.dirname(__FILE__))

def each_sample glob="*.png"
  Dir[File.join(SAMPLES_DIR, glob)].each do |fname|
    yield fname.sub(Dir.pwd+'/','')
  end
end

def sample fname
  fname = File.join(SAMPLES_DIR, fname)
  if block_given?
    yield fname.sub(Dir.pwd+'/','')
  end

  fname
end

def cli *args
  @@cli_cache ||= {}
  @@cli_cache[args.inspect] ||=
    begin
      args << "--no-color" unless args.any?{|x| x['color']}
      orig_stdout, out = $stdout, ""
      begin
        $stdout = StringIO.new(out)
        ZSteg::CLI.new(args).run
      ensure
        $stdout = orig_stdout
      end
      out.strip
    end
end

RSpec.configure do |config|
  config.before :suite do
    Dir[File.join(SAMPLES_DIR, "*.7z")].each do |fname|
      next if File.exist?(fname.sub(/\.7z$/,''))
      system "7z", "x", fname, "-o#{SAMPLES_DIR}"
    end
  end
end

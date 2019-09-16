require 'osx_trash/version'

module OSX

  class << self
    def trash(opt={})
      return nil if init_validate(opt)

      @paths = source_paths(opt)
      send_to_trash
    end

    attr_reader :path, :results, :errors

    private

    def init_validate(opt)
      valid = opt.is_a?(Hash) && (opt[:file] || opt[:paths])
      unless valid
        raise TypeError.new "input must be hash with file: or paths:"
      end
      valid
    end

    def source_paths(opt)
      paths = opt[:paths] || File.readlines(opt[:file])
      clean_input(paths)
    end

    # osax is expensive - clean inputs of non-existant files first.
    def clean_input(paths)
      paths
        .map(&:strip)
        .reject(&:empty?)
        .select{|f| File.exist? f }
    end


    def send_to_trash
      @results = @paths.map do |f|
        IO.popen("osascript 2>&2", "w") do |stdin|
          stdin.puts %Q{tell app "Finder" to move the POSIX file "#{f}" to trash}
        end
        [$?.to_json, f]
      end

      gather_errors
      @results
    end

    def gather_errors
      @errors = @results.select {|fs| fs.first.match("exit 1") }
    end
  end
end


class OSXTrash

  attr_reader :path, :results, :errors

  def initialize(opt={})
    return nil if init_validate(opt)

    @paths = source_paths(opt)
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

  private

  def init_validate(opt)
    !opt.is_a?(Hash) && (opt[:file] || opt[:paths])
  end

  def source_paths(opt)
    paths = opt[:paths] || File.readlines(opt[:file])
    clean_input(paths)
  end

  def clean_input(paths)
    paths.map(&:strip).reject(&:empty?)
  end
end

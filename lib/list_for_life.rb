require "net/http"
require "tmpdir"
require "uri"

class ListForLife < Array
  VERSION = "1.0.0".freeze
  # This is basically a license-free Scrabble dictionary provided by
  # Word Game Dictionary (https://www.wordgamedictionary.com/)
  DEFAULT_URL = "https://www.wordgamedictionary.com/english-word-list/download/english.txt".freeze

  attr_accessor :url
  attr_accessor :uri
  attr_accessor :path

  def initialize(url: DEFAULT_URL, path: Dir.mktmpdir("list_for_life-"), case_sensitive: false)
    # Initialize a totally empty Array first, with none of the options
    # that #new is called with -- then build out a new ListForLife object
    super()
    @url = url
    @uri = URI.parse(url)
    @path = File.join(path, File.basename(uri.path))
    @case_sensitive = case_sensitive
    reload
  end

  def reload
    download
    read_list
  end

  def refresh!
    download!
    read_list
  end

  def case_sensitive?
    !!@case_sensitive
  end

  def case_sensitive=(boolean)
    @case_sensitive = !!boolean
    reload
  end

  def download(force: false)
    return unless !File.exist?(path) || force

    File.open(path, "w") do |wordlist|
      wordlist.puts Net::HTTP.get(uri)
    end
  end
  private :download

  def download!
    download(force: true)
  end
  private :download!

  def read_list
    return replace(File.readlines(path).map(&:strip)) if case_sensitive?
    replace(File.readlines(path).map!(&:strip)).map!(&:downcase)
  end
  private :read_list
end

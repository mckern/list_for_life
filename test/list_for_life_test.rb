require_relative "test_helper"
require "list_for_life"

class TestListForLife < Minitest::Test
  attr_reader :words
  attr_reader :lowercase_words
  attr_reader :mixedcase_words

  def setup
    @words = ListForLife.new(
      path: fixture_path,
      url: fixture_path("words")
    )

    @mixedcase_words = File.readlines(fixture_path("words"))
    @lowercase_words = @mixedcase_words.map(&:downcase)
  end

  def test_wordlists_default_to_case_insensitive
    assert_empty words & lowercase_words
  end

  def test_wordlists_support_case_sensitivity
    assert_empty words.select { |w| w =~ /[A-Z]/ }
    words.case_sensitive = true
    assert words.select { |w| w =~ /[A-Z]/ }
  end
end

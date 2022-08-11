require 'rails_helper'

RSpec.describe Shortener do

  it "shortens a given URL to a 7 character lookup code" do
    url = "https://www.codegrepper.com/code-examples/ruby/how+to+check+ruby+version"
    shortenter = Shortener.new(url)
    expect(shortenter.lookup_code.length).to_eq(7)
  end

  it "gives each URL its own lookup code" do
    url = "https://www.codegrepper.com/code-examples/ruby/how+to+check+ruby+version"
    shortenter = Shortener.new(url)
    code1 = shortenter.lookup_code

    url = "https://www.codegrepper.com/code-examples/ruby/how+to+check+ruby+version"
    shortenter = Shortener.new(url)
    code2 = shortenter.lookup_code

    expect(code2).not_to eq(code1)

  end


end
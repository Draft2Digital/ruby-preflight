require File.dirname(__FILE__) + "/../spec_helper"

describe Preflight::Rules::OnlyEmbeddedFonts do

  it "pass files with a subsetted TTF font" do
    filename = pdf_spec_file("pdfx-1a-subsetting")
    ohash    = PDF::Reader::ObjectHash.new(filename)
    chk      = Preflight::Rules::OnlyEmbeddedFonts.new

    chk.messages(ohash).should be_empty
  end

  it "pass files with a complete TTF font" do
    filename = pdf_spec_file("pdfx-1a-no-subsetting")
    ohash    = PDF::Reader::ObjectHash.new(filename)
    chk      = Preflight::Rules::OnlyEmbeddedFonts.new

    chk.messages(ohash).should be_empty
  end

  it "pass files with a subsetted Type1 font as a descendant of a Type0 font"

  it "pass files with a subsetted TTF font as a descendant of a Type0 font" do
    filename = pdf_spec_file("pdfa-1a")
    ohash    = PDF::Reader::ObjectHash.new(filename)
    chk      = Preflight::Rules::OnlyEmbeddedFonts.new

    puts chk.messages(ohash)
    chk.messages(ohash).should be_empty
  end

  it "fail files with a adobe 'standard 14' font" do
    filename = pdf_spec_file("standard_14_font")
    ohash    = PDF::Reader::ObjectHash.new(filename)
    chk      = Preflight::Rules::OnlyEmbeddedFonts.new

    chk.messages(ohash).should_not be_empty
  end

  it "pass files with a non-embedded base-14 font in an AcroForm that has no fields" do
    filename = pdf_spec_file("acroform")
    ohash    = PDF::Reader::ObjectHash.new(filename)
    chk      = Preflight::Rules::OnlyEmbeddedFonts.new

    puts chk.messages(ohash)
    chk.messages(ohash).should be_empty
  end
end

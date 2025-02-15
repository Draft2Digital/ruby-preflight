# coding: utf-8

module Preflight
  module Profiles
    class PDFX1A_2003
      include Preflight::Profile

      profile_name "pdfx-1a:2003"

      rule Preflight::Rules::MatchInfoEntries, {:GTS_PDFXVersion => /\APDF\/X/}
      rule Preflight::Rules::RootHasKeys, :OutputIntents
      rule Preflight::Rules::InfoHasKeys, :Title, :CreationDate, :ModDate
      rule Preflight::Rules::InfoSpecifiesTrapping
      rule Preflight::Rules::CompressionAlgorithms, :ASCII85Decode, :CCITTFaxDecode, :DCTDecode, :FlateDecode, :RunLengthDecode
      rule Preflight::Rules::DocumentId
      rule Preflight::Rules::NoFilespecs
      rule Preflight::Rules::NoTransparency
      rule Preflight::Rules::OnlyEmbeddedFonts
      rule Preflight::Rules::BoxNesting
      rule Preflight::Rules::MaxVersion, 1.4
      rule Preflight::Rules::PrintBoxes
      rule Preflight::Rules::OutputIntentForPdfx
      rule Preflight::Rules::PdfxOutputIntentHasKeys, :OutputConditionIdentifier, :Info
      rule Preflight::Rules::NoRgb

    end
  end
end
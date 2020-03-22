require 'spec_helper'

describe LocaleMap do # rubocop:todo Metrics/BlockLength
  expected_locale_count = 39
  let(:map) { described_class.new }

  describe '.all' do
    it 'returns all locales' do
      expect(map.all.length).to eq expected_locale_count
    end

    it 'integrates changes to existing locales from providers' do
      map.add_provider TestLocaleProvider.new
      locales = map.all

      expect(locales[:arSA][:test]).to eq 'foo'
    end

    it 'integrates changes to new locales from providers' do
      map.add_provider TestLocaleProvider.new
      locales = map.all

      expect(locales[:foo][:test]).to eq 'foo'
    end
  end

  describe '.app_store_connect' do
    it 'returns only App Store Connect locale codes' do
      expect(map.app_store_connect.length).to eq expected_locale_count
    end

    it 'returns a hash' do
      expect(map.app_store_connect).to be_a Hash
    end

    it 'all hash values are strings' do
      expect(map.app_store_connect.values).to all(be_a String)
    end
  end

  describe '.google_play' do
    it 'returns only Play Store locale codes' do
      expect(map.google_play.length).to eq expected_locale_count
    end

    it 'returns a hash' do
      expect(map.google_play).to be_a Hash
    end

    it 'all hash values are strings' do
      expect(map.google_play.values).to all(be_a String)
    end
  end

  describe '.iso_codes' do
    it 'returns only ISO codes' do
      expect(map.iso_codes.length).to eq expected_locale_count
    end

    it 'returns a hash' do
      expect(map.iso_codes).to be_a Hash
    end

    it 'all hash values are strings' do
      expect(map.iso_codes.values).to all(be_a String)
    end

    it 'all languages keys are ISO locale codes with dashes removed' do
      map.all.each do |key, locale|
        expect(key.to_s).to eq locale[:iso].gsub('-', '')
      end
    end
  end

  describe '.add_provider' do
    it 'adds the provider to the list' do # rubocop:todo RSpec/MultipleExpectations
      expect(map.providers).to be_empty
      map.add_provider TestLocaleProvider.new
      expect(map.providers.length).to eq 1
    end

    it 'raises for invalid providers' do
      expect do
        map.add_provider Object.new
      end.to raise_error(RuntimeError)
    end

    it 'raises for non-conforming providers' do
      expect do
        map.add_provider NonConformingLocaleProvider.new
      end.to raise_error(RuntimeError)
    end
  end
end

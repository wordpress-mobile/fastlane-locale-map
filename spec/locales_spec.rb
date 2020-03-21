require 'spec_helper'

class TestProvider
  def locales
    {
      arSA: {
        test: 'foo'
      },
      foo: {
        test: 'foo'
      }
    }
  end
end

describe FastlaneLocaleMap do
  before do
    described_class.providers.each do |provider|
      described_class.remove_provider provider
    end
  end

  expected_locale_count = 39

  describe '.all' do
    it 'returns all locales' do
      expect(described_class.all.length).to eq expected_locale_count
    end

    it 'integrates changes to existing locales from providers' do
      described_class.add_provider TestProvider.new
      locales = described_class.all

      expect(locales[:arSA][:test]).to eq 'foo'
    end

    it 'integrates changes to new locales from providers' do
      described_class.add_provider TestProvider.new
      locales = described_class.all

      expect(locales[:foo][:test]).to eq 'foo'
    end
  end

  describe '.app_store_connect' do
    it 'returns only App Store Connect locale codes' do
      expect(described_class.app_store_connect.length).to eq expected_locale_count
    end

    it 'returns a hash' do
      expect(described_class.app_store_connect).to be_a Hash
    end

    it 'all hash values are strings' do
      expect(described_class.app_store_connect.values).to all(be_a String)
    end
  end

  describe '.google_play' do
    it 'returns only Play Store locale codes' do
      expect(described_class.google_play.length).to eq expected_locale_count
    end

    it 'returns a hash' do
      expect(described_class.google_play).to be_a Hash
    end

    it 'all hash values are strings' do
      expect(described_class.google_play.values).to all(be_a String)
    end
  end

  describe '.iso_codes' do
    it 'returns only ISO codes' do
      expect(described_class.iso_codes.length).to eq expected_locale_count
    end

    it 'returns a hash' do
      expect(described_class.iso_codes).to be_a Hash
    end

    it 'all hash values are strings' do
      expect(described_class.iso_codes.values).to all(be_a String)
    end

    it 'all languages keys are ISO locale codes with dashes removed' do
      described_class.all.each do |key, locale|
        expect(key.to_s).to eq locale[:iso].gsub('-', '')
      end
    end
  end

  describe '.add_provider' do
    it 'adds the provider to the list' do
      expect(described_class.providers.length).to eq 0
      described_class.add_provider TestProvider.new
      expect(described_class.providers.length).to eq 1
    end
  end
end
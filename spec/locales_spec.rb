require 'spec_helper'

class TestProvider
    def locales
        {
            :arSA   => {
                :test   => "foo",
            },
            :foo    => {
                :test   => "foo",
            }
        }
    end
end

describe FastlaneLocaleMap do

    before(:each) do
        FastlaneLocaleMap.providers.each { |provider|
            FastlaneLocaleMap.removeProvider provider
        }
    end

    expected_locale_count = 39

    describe '.all' do
        it 'returns all locales' do
            expect(FastlaneLocaleMap.all.length).to eq expected_locale_count
        end

        it 'integrates changes to existing locales from providers' do
            FastlaneLocaleMap.addProvider TestProvider.new
            locales = FastlaneLocaleMap.all

            expect(locales[:arSA][:test]).to eq "foo"
        end

        it 'integrates changes to new locales from providers' do
            FastlaneLocaleMap.addProvider TestProvider.new
            locales = FastlaneLocaleMap.all

            expect(locales[:foo][:test]).to eq "foo"
        end
    end

    describe '.appStoreConnect' do
        it 'returns only App Store Connect locale codes' do
            expect(FastlaneLocaleMap.appStoreConnect.length).to eq expected_locale_count
        end

        it 'returns a hash' do
            expect(FastlaneLocaleMap.appStoreConnect).to be_a Hash
        end

        it 'all hash values are strings' do
            expect(FastlaneLocaleMap.appStoreConnect.values).to all(be_a String)
        end
    end

    describe '.playStore' do
        it 'returns only Play Store locale codes' do
            expect(FastlaneLocaleMap.googlePlay.length).to eq expected_locale_count
        end

        it 'returns a hash' do
            expect(FastlaneLocaleMap.googlePlay).to be_a Hash
        end

        it 'all hash values are strings' do
            expect(FastlaneLocaleMap.googlePlay.values).to all(be_a String)
        end
    end

    describe '.isoCodes' do
        it 'returns only ISO codes' do
            expect(FastlaneLocaleMap.isoCodes.length).to eq expected_locale_count
        end

        it 'returns a hash' do
            expect(FastlaneLocaleMap.isoCodes).to be_a Hash
        end

        it 'all hash values are strings' do
            expect(FastlaneLocaleMap.isoCodes.values).to all(be_a String)
        end

        it 'all languages keys are ISO locale codes with dashes removed' do
            FastlaneLocaleMap.all.each { |key,locale|
                expect(key.to_s).to eq locale[:iso].gsub('-', '')
            }
        end
    end

    describe '.addProvider' do
        it 'adds the provider to the list' do
            expect(FastlaneLocaleMap.providers.length).to eq 0
            FastlaneLocaleMap.addProvider TestProvider.new
            expect(FastlaneLocaleMap.providers.length).to eq 1
        end
    end
end

module FastlaneLocaleMap
  @@providers = []

  def self.all
    require 'deep_merge'

    locales = self.locales

    @@providers.each do |provider|
      locales = locales.deep_merge provider.locales
    end

    locales
  end

  def self.app_store_connect
    all.each_with_object({}) do |(key, locale), hash|
      hash[key] = locale[:appStore]
    end
  end

  def self.google_play
    all.each_with_object({}) do |(key, locale), hash|
      hash[key] = locale[:playStore]
    end
  end

  def self.iso_codes
    all.each_with_object({}) do |(key, locale), hash|
      hash[key] = locale[:iso]
    end
  end

  def self.add_provider(provider)
    @@providers.append provider
  end

  def self.remove_provider(provider)
    index = @@providers.index(provider)
    @@providers.delete_at index
  end

  def self.providers
    @@providers
  end

  def self.locales
    {
      arSA: {
        english: 'Arabic (Saudi Arabia)',
        iso: 'ar-SA',
        appStore: 'ar-SA',
        playStore: 'ar'
      },
      ca: {
        english: 'Catalan',
        iso: 'ca',
        appStore: 'ca',
        playStore: 'ca'
      },
      cs: {
        english: 'Czech',
        iso: 'cs',
        appStore: 'cs',
        playStore: 'cs'
      },
      da: {
        english: 'Danish',
        iso: 'da',
        appStore: 'da',
        playStore: 'da-DK'
      },
      deDE: {
        english: 'German (Germany)',
        iso: 'de-DE',
        appStore: 'de-DE',
        playStore: 'de-DE'
      },
      el: {
        english: 'Greek',
        iso: 'el',
        appStore: 'el',
        playStore: 'el-GR'
      },
      enAU: {
        english: 'English (Australia)',
        iso: 'en-AU',
        appStore: 'en-AU',
        playStore: 'en-AU'
      },
      enCA: {
        english: 'English (Canada)',
        iso: 'en-CA',
        appStore: 'en-CA',
        playStore: 'en-CA'
      },
      enGB: {
        english: 'English (United Kingdom)',
        iso: 'en-GB',
        appStore: 'en-GB',
        playStore: 'en-GB'
      },
      enUS: {
        english: 'English (United States)',
        iso: 'en-US',
        appStore: 'en-US',
        playStore: 'en-US'
      },
      esES: {
        english: 'Spanish (Spain)',
        iso: 'es-ES',
        appStore: 'es-ES',
        playStore: 'es-ES'
      },
      esMX: {
        english: 'Spanish (Mexico)',
        iso: 'es-MX',
        appStore: 'es-MX',
        playStore: 'es-MX'
      },
      fi: {
        english: 'Finnish',
        iso: 'fi',
        appStore: 'fi',
        playStore: 'fi-FI'
      },
      frCA: {
        english: 'French (Canada)',
        iso: 'fr-CA',
        appStore: 'fr-CA',
        playStore: 'fr-CA'
      },
      frFR: {
        english: 'French (France)',
        iso: 'fr-FR',
        appStore: 'fr-FR',
        playStore: 'fr-FR'
      },
      he: {
        english: 'Hebrew',
        iso: 'he',
        appStore: 'he',
        playStore: 'iw-IL'
      },
      hi: {
        english: 'Hindi',
        iso: 'hi',
        appStore: 'hi',
        playStore: 'hi-IN'
      },
      hr: {
        english: 'Croatian',
        iso: 'hr',
        appStore: 'hr',
        playStore: 'hr'
      },
      hu: {
        english: 'Hungarian',
        iso: 'hu',
        appStore: 'hu',
        playStore: 'hu-HU'
      },
      id: {
        english: 'Indonesian',
        iso: 'id',
        appStore: 'id',
        playStore: 'id'
      },
      it: {
        english: 'Italian',
        iso: 'it',
        appStore: 'it',
        playStore: 'it-IT'
      },
      ja: {
        english: 'Japanese',
        iso: 'ja',
        appStore: 'ja',
        playStore: 'ja-JP'
      },
      ko: {
        english: 'Korean',
        iso: 'ko',
        appStore: 'ko',
        playStore: 'ko-KR'
      },
      ms: {
        english: 'Malay',
        iso: 'ms',
        appStore: 'ms',
        playStore: 'ms'
      },
      nlNL: {
        english: 'Dutch (Netherlands)',
        iso: 'nl-NL',
        appStore: 'nl-NL',
        playStore: 'nl-NL'
      },
      nb: {
        english: 'Norwegian',
        iso: 'nb',
        appStore: 'no',
        playStore: 'no-NO'
      },
      pl: {
        english: 'Polish',
        iso: 'pl',
        appStore: 'pl',
        playStore: 'pl-PL'
      },
      ptBR: {
        english: 'Portuguese (Brazil)',
        iso: 'pt-BR',
        appStore: 'pt-BR',
        playStore: 'pt-BR'
      },
      ptPT: {
        english: 'Portuguese (Portugal)',
        iso: 'pt-PT',
        appStore: 'pt-PT',
        playStore: 'pt-PT'
      },
      ro: {
        english: 'Romanian',
        iso: 'ro',
        appStore: 'ro',
        playStore: 'ro'
      },
      ru: {
        english: 'Russian',
        iso: 'ru',
        appStore: 'ru',
        playStore: 'ru-RU'
      },
      sk: {
        english: 'Slovak',
        iso: 'sk',
        appStore: 'sk',
        playStore: 'sk'
      },
      sv: {
        english: 'Swedish',
        iso: 'sv',
        appStore: 'sv',
        playStore: 'sv-SE'
      },
      th: {
        english: 'Thai',
        iso: 'th',
        appStore: 'th',
        playStore: 'th'
      },
      tr: {
        english: 'Turkish',
        iso: 'tr',
        appStore: 'tr',
        playStore: 'tr-TR'
      },
      uk: {
        english: 'Ukrainian',
        iso: 'uk',
        appStore: 'uk',
        playStore: 'uk'
      },
      vi: {
        english: 'Vietnamese',
        iso: 'vi',
        appStore: 'vi',
        playStore: 'vi'
      },
      zhCN: {
        english: 'Chinese (Simplified)',
        iso: 'zh-CN',
        appStore: 'zh-Hans',
        playStore: 'zh-CN'
      },
      zhTW: {
        english: 'Chinese (Traditional)',
        iso: 'zh-TW',
        appStore: 'zh-Hant',
        playStore: 'zh-TW'
      }
    }
  end
end

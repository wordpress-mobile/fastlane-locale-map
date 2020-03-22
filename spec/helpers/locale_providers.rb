class TestLocaleProvider
  include LocaleProvider
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

class NonConformingLocaleProvider
  include LocaleProvider
end

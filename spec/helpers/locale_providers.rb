class TestLocaleProvider
  include LocaleProvider
  def locale_map
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

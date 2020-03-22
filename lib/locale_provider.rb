module LocaleProvider
  def locales
    raise "You must implement `locales` in #{self.class}"
  end
end

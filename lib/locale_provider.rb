##
# This module defines an interface for providing locales to a LocaleMap.
module LocaleProvider
  def locales
    raise "You must implement `locales` in #{self.class}"
  end
end

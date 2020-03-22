##
# This module defines an interface for providing locales to a LocaleMap.
module LocaleProvider
  def locale_map
    raise "You must implement `locale_map` in #{self.class}"
  end
end

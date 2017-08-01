# frozen_string_literal: true

require_relative "../date_and_time/compatibility"
require_relative "../module/remove_method"

class Time
  include DateAndTime::Compatibility

  remove_possible_method :to_time

  # Either return +self+ or the time in the local system timezone depending
  # on the setting of +ActiveSupport.to_time_preserves_timezone+.
  def to_time
    preserve_timezone ? self : getlocal
  end
end

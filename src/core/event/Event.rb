# This class is the abstract class of event
class Event
  attr_accessor :event_name
  attr_accessor :event_displayed

  def initialize(_event_name, _event_data = nil)
    @event_name = _event_name
    @event_displayed = false
    if _event_data != nil
      initialize_event_data(_event_data)
    end
  end

  def initialize_event_data(event)
    raise("Event constructor has been called which isn't possible normally cause it's used like abstract class")
  end

  # Function called every frame (like a draw fun)
  def update
    raise("Cannot update an abstract Event")
  end
end
class Menu
  attr_accessor :entries

  def initialize(entries:)
    # Expects to receive an array of hashes containing the entries for the menu: 
    # [ {value: 'text', selected: true}, {value: 'text'}]
    @entries = entries.map { |entry| Entry.new(value: entry[:value], selected: entry[:selected] || false) }
  end

  def serialize
    { entries: @entries.map { |entry| { value: entry.value, selected: entry.selected } } }
  end

  def move_up_or_down(move_up:)
    selected_entry_index = @entries.find_index { |entry| entry.selected }
    @entries[selected_entry_index].disable
    incrementer = move_up ? -1 : 1
    @entries[(selected_entry_index + incrementer).clamp(0, @entries.size - 1)].enable
  end

  def render(args:, top:)
    @entries.each_with_index { |entry, i| args.outputs.labels << { x: 640, y: top - i * 40, text: entry.value, size_enum: 5, alignment_enum: 1, a: entry.selected ? 255 : 120 } }
  end

  def selected_entry
    @entries.find { |entry| entry.selected }.value
  end

  private

  class Entry
    attr_reader :value, :selected

    def initialize(value: 'Error: undefined menu item', selected: false)
      # Defines a menu entry, and expects to receive the text value and whether it is currently selected
      @value = value.freeze
      @selected = selected
    end

    def enable
      @selected = true
    end

    def disable
      @selected = false
    end
  end
end

require 'shoes'
require_relative 'profile'
require_relative 'entry'

profile = Profile.new

Shoes.app width: 560, height: 350 do
  background white
  stack(margin: 8) do 
    banner "GHOUL"
  end
  stack(margin: 8) do
    profile.entries.each do |entry|
      row = flow do 
        edit_line entry.key
        edit_line entry.value
        button "save"
        del = button "delete"
        del.click() do 
          if confirm("Draw a circle?")
            row.clear
          end
        end
      end
    end
  end
  @new_row = stack(margin: 8) do
    tagline "New Entry" 
    flow do 
      key_line = edit_line
      value_line = edit_line
      save_button = button "save"
      cancel_button = button "cancel"

      cancel_button.click() do 
        @new_row.hide
        @new_stack.show
      end
    end
  end
  @new_row.hide
  @new_stack = stack(margin: 8) do 
    new_button = button "New"
    new_button.click() do 
      @new_row.show
      @new_stack.hide
    end
  end
end
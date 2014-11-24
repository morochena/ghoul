require 'shoes'
require_relative 'profile'
require_relative 'entry'


Shoes.app title: 'Ghoul', width: 560, height: 350 do
  background white
  @profile = Profile.new


  stack(margin: 8) do 
    banner "GHOUL"
  end

  @entry_stack = stack(margin: 8) do
    @profile.entries.each do |entry|
      row = flow do 

        key = edit_line entry.key
        value = edit_line entry.value
        save_button = button "save"
        delete_button = button "delete"

        save_button.click() do 
          entry.save_changes(key.text, value.text)
        end

        delete_button.click() do 
          if confirm("Are you sure?")
            row.clear
          end
        end

      end
    end
  end

  @new_row = stack(margin: 8) do
    tagline "New Entry" 
    flow do 

      key = edit_line
      value = edit_line
      save_button = button "save"
      cancel_button = button "cancel"

      save_button.click() do 
        @profile.entries << Entry.new("exports #{key.text}=#{value.text}")
        refresh
        key.text = ""
        value.text = ""
        @new_row.hide
        @new_stack.show
      end

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
    save_button = button "Write changes"
    save_button.click() do 
      @profile.write_profile
    end
  end

  def refresh
    @entry_stack.clear
    @profile.entries.each do |entry|
      @entry_stack.append do
        row = flow do 

        key = edit_line entry.key
        value = edit_line entry.value
        save_button = button "save"
        delete_button = button "delete"

        save_button.click() do 
          entry.save_changes(key.text, value.text)
        end

        delete_button.click() do 
          if confirm("Are you sure?")
            row.clear
          end
        end

      end
    end

    end
  end

end
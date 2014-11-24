array = [1,2,3]

Shoes.app do
  background white
  stack(margin: 8) do
    array.each do |a|
      a = flow do 
        edit_line 
        edit_line
        button "save"
        del = button "delete"
        del.click() do 
          a.clear
        end
      end
    end
  end
end
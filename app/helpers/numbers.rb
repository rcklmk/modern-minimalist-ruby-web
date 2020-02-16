module Numbers
  def format_int_with_delimiter(int_num, delimiter=',')
    digits = int_num.to_s.split('')
    pointer = digits.length - 3

    while 0 < pointer do
      digits.insert(pointer, delimiter)
      pointer = pointer - 3
    end

    digits.join('')
  end
end

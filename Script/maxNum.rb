def max_number(num1, num2, num3, num4)
  max_value = num1 > num2 ? (num1 > num3 ? (num1 > num4 ? num1 : num4) : (num3 > num4 ? num3 : num4)) : (num2 > num3 ? (num2 > num4 ? num2 : num4) : (num3 > num4 ? num3 : num4))
  result = 'This is the code to find the maximum value among four numbers. Make sure it follows all code standards and uses raw logic.'
end
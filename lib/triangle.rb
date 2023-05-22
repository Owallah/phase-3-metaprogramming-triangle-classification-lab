class Triangle

  def initialize(length, width, height)
    @length = length
    @width = width
    @height = height
  end

  def kind
    triangle_sides = [@length, @width, @height]
    equal_sides = triangle_sides.uniq

    raise TriangleError if triangle_sides.any? { |side| side <= 0 }
    raise TriangleError unless inequality?

    # unless the method inequality? returns false
    # do the following
    case equal_sides.size
    when 1
      :equilateral
    when 2
      :isosceles
    when 3
      :scalene
    else
      raise TriangleError
    end
  end

  private

  # The sum of the lengths of any two sides of
  # a triangle always exceeds the length of the 
  # third side. This is a principle known as the 
  # triangle inequality.
  
  # this method will return true if the triangle 
  # inequality rule is achieved
  def inequality?
    (@length + @width > @height) && (@width + @height > @length) && (@height + @length > @width)
  end

  class TriangleError < StandardError
      def message
        "Invalid triangle!"
      end
  end

end


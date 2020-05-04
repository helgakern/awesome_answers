require "minitest/autorun"

class Circle
    attr_accessor :radius

    def initialize(radius)
        @radius = radius
    end

    def diameter
        @radius * 2
    end

    def area 
        @radius * @radius * 3.14
    end

    def perimeter
        2 * 3.14 * @radius
    end
end

describe Circle do
    describe ".area" do
      it "return the calculated area of the circle" do
        # given
        crcl = Circle.new(5)
  
        # When
        area = crcl.area
  
        # Then
        _(area).must_equal(78.5)
      end
    end
  
    describe ".perimeter" do
      it "return the calculated perimeter of the circle" do
        crcl = Circle.new(5)
  
        perm = crcl.perimeter
  
        _(perm).must_equal(31.400000000000002)

      end
    end
  
    describe ".diameter" do
      it "return the diameter of the circle" do
        crcl = Circle.new(5)
  
        _(crcl.diameter).must_equal(10)
      end
    end
  end


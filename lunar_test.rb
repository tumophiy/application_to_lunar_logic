# frozen_string_literal: true

class SolvingQuestion
  def initialize(array)
    @array = array
  end

  def check
    @working_array = each_element_to_array(@array)
    print @working_array
    create_variants(@working_array)
    # filter_variants(create_variants(@working_array))
    puts ''
    @working_array.each { |v| puts devisible_by_3?(v) }
  end

  private

  def devisible_by_3?(number_stored_as_array)
    # p number
    (number_stored_as_array.sum % 3).zero?
  end

  def each_element_to_array(array)
    array.map { |number| number.to_s.split('').map(&:to_i) }
  end

  def create_variants(array)
  end

  def filter_variants(array)
  end
end

a = SolvingQuestion.new([110, 222, 3333])
a.check

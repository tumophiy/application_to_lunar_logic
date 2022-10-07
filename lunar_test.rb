# frozen_string_literal: true

class SolvingQuestion
  def initialize(array)
    @array = array
  end

  def check
    @working_array = each_element_to_array(@array)
    create_variants(@working_array)
  end

  private

  def devisible_by_3?(number_stored_as_array)
    (number_stored_as_array.sum % 3).zero?
  end

  def each_element_to_array(array)
    array.map { |number| number.to_s.split('').map(&:to_i) }
  end

  def create_hash_with_true_or_false_values(array)
    @hash = {}
    array.each { |value| @hash[value] = devisible_by_3?(value) }
  end

  def count_false_values(hash)
    count = 0
    hash.each { |_key, value| count += 1 if value == false }
    count
  end

  def reconstruct_arrays_into_numbers(array)
    array.map { |value| value.map(&:to_s).join('').to_i }
  end

  def print_answer
    print "The anwer is #{filter_variants(@reconstructed_array)}"
  end

  def create_variants(array)
    create_hash_with_true_or_false_values(array)
    count = count_false_values(@hash)
    if count == 1
      working_region = @hash.filter { |_key, value| value == false }.keys.first
      ready_region = @hash.filter { |_key, value| value == true }.keys
      sum = working_region.sum
      remainder = sum % 3
      remainder == 0 ? our_changes = possible_changes : remainder == 1 ? our_changes = 5 : our_changes = 4
      array_of_variants = ready_region << working_region.each_with_object([]) do |number, array|
        next if number == 9

        number_before_modification = number
        number = [9, number + our_changes].min
        array << number
        our_changes -= number - number_before_modification
      end
    end
    @reconstructed_array = [reconstruct_arrays_into_numbers(array_of_variants)]
    print_answer
  end

  def filter_variants(array)
    max_count = 0
    max_array = 0
    array.each do |variant|
      max_array = variant if variant.sum > max_count
      max_count = variant.sum
    end
    max_array
  end
end

a = SolvingQuestion.new([110, 222, 3333])
a.check

module Exercise
  module Arrays
    class << self
      def replace(array)
        max_elem = quick_sort(array).last
        array.map do |elem|
          if elem.positive?
            max_elem
          else
            elem
          end
        end
      end

      def search(array, query, from = 0, to = nil)
        to ||= array.size - 1

        return -1 if from > to

        mid = (from + to) / 2
        return mid if query == array[mid]

        if query < array[mid]
          search(array, query, from, mid - 1)
        else
          search(array, query, mid + 1, to)
        end
      end

      def quick_sort(array)
        return array if array.size < 2

        pivot, *ar = array
        less = ar.filter { |elem| elem < pivot }
        greater = ar.filter { |elem| elem >= pivot }

        quick_sort(less) + [pivot] + quick_sort(greater)
      end
    end
  end
end

module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(array = nil, &func)
        array ||= self
        return self if array.empty?

        first, *rest = array
        func.call(first)

        my_each(rest, &func)
      end

      # Написать свою функцию my_map
      def my_map(&func)
        result = MyArray.new
        my_reduce(result) { |acc, el| acc << func.call(el) }
      end

      # Написать свою функцию my_compact
      def my_compact
        result = MyArray.new
        my_reduce(result) do |acc, el|
          if el.nil?
            acc
          else
            acc << el
          end
        end
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil, array = nil, &func)
        array ||= self
        return acc if array.empty?

        first, *rest = array

        acc = if acc.nil?
                first
              else
                func.call(acc, first)
              end

        my_reduce(acc, rest, &func)
      end
    end
  end
end

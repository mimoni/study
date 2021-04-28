module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        filtered_films = array.filter do |film|
          countries = film['country'] && film['country'].split(',').size > 1
          film['rating_kinopoisk'].to_f.positive? && countries
        end

        sum = filtered_films.reduce(0) { |memo, film| memo + film['rating_kinopoisk'].to_f }
        sum / filtered_films.size.to_f
      end

      def chars_count(films, threshold)
        films.reduce(0) do |result, film|
          if film['rating_kinopoisk'].to_f >= threshold
            result + film['name'].count('и')
          else
            result
          end
        end
      end
    end
  end
end

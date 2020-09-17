def all_words_capitalized?(arr)
    arr.all? { |word| word == word.capitalize}
end


def no_valid_url?(urls)
    valid_endings = [".com", ".net", ".io", ".org"]
    urls.none? do |url|
        valid_endings.any? { |ending| url.end_with?(ending) }
    end

end 

def any_passing_students?(arr)
    arr.any? { |hash| ( hash[:grades].sum / hash[:grades].length ) >= 75 }
    end
end
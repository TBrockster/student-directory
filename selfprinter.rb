def selfload
    File::open("selfprinter.rb", "r") do |f|
        f.readlines.each do |line|
            puts line
        end
    end
end

selfload

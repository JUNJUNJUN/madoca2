require_relative 'madoca2'

f1 = 'C:\Users\fujioka\RubymineProjects\madoca2\lib\test\magps_a\em2\1\config.tbl'
f2 = 'C:\Users\fujioka\RubymineProjects\madoca2\lib\test\magps_a\em2\2\config.tbl'

mmr = Madoca2::File.load(f2)

p mmr

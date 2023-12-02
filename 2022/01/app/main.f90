program main
   use aoc
   implicit none

   character(len=256), parameter :: filename = 'input'
   integer, dimension(:), allocatable :: weights
   integer :: i

   call read_and_sort_backpacks_from_file(filename, weights)
   print *, "Part 1: ", solve_part_1(weights)
   print *, "Part 2: ", solve_part_2(weights)
end program main

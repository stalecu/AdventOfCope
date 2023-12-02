module aoc
   use, intrinsic :: iso_fortran_env, only: int64
   use stdlib_io, only: getline, open
   use stdlib_sorting, only: sort
   implicit none
   public :: read_and_sort_backpacks_from_file, solve_part_1, solve_part_2
contains
   subroutine read_and_sort_backpacks_from_file(filename, weights)
      character(len=*), intent(in) :: filename
      integer, allocatable, intent(out) :: weights(:)
      integer :: u, weight, stat, sum
      logical :: lexist, lopen

      character(len=:), allocatable :: line

      inquire (file=filename, exist=lexist)
      if (.not. lexist) then
         print *, "File doesn't exist: ", filename
         stop
      end if

      u = open (filename, iostat=stat)

      inquire (unit=u, opened=lopen)
      if (.not. lopen) then
         print *, "File couldn't be opened: ", filename
         stop
      end if

      allocate (weights(0))

      sum = 0
      do
         call getline(u, line, stat)
         if (stat /= 0) exit

         if (len_trim(line) .ne. 0) then
            read (line, *, iostat=stat) weight
            sum = sum + weight
         else
            weights = [weights, sum]
            sum = 0
         end if
      end do

      if (sum /= 0) then
         weights = [weights, sum]
      end if

      close (u)

      call sort(weights, reverse=.true.)
   end subroutine read_and_sort_backpacks_from_file

   function solve_part_1(weights) result(result)
      integer, allocatable, intent(in) :: weights(:)
      integer :: result

      result = weights(1)
   end function solve_part_1

   function solve_part_2(weights) result(result)
      integer, dimension(:), allocatable, intent(in) :: weights
      integer :: result

      result = weights(1) + weights(2) + weights(3)
   end function solve_part_2
end module aoc

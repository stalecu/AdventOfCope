module test_suite_1
   use testdrive, only: new_unittest, unittest_type, error_type, check
   use aoc
   implicit none
   private

   public :: collect_suite1
contains
   subroutine collect_suite1(testsuite)
      !> Collection of tests
      type(unittest_type), allocatable, intent(out) :: testsuite(:)

      testsuite = [ &
                  new_unittest("part 1", test_part_1), &
                  new_unittest("part 2", test_part_2) &
                  ]

   end subroutine collect_suite1

   subroutine test_part_1(error)
      type(error_type), allocatable, intent(out) :: error

      integer, dimension(:), allocatable :: weights
      call read_and_sort_backpacks_from_file('example', weights)

      call check(error, size(weights), 5)
      if (allocated(error)) return

      call check(error, maxval(weights), 24000)
      if (allocated(error)) return

      call check(error, solve_part_1(weights), 24000)
      if (allocated(error)) return
   end subroutine test_part_1

   subroutine test_part_2(error)
      type(error_type), allocatable, intent(out) :: error

      integer, dimension(:), allocatable :: weights
      call read_and_sort_backpacks_from_file('example', weights)

      call check(error, size(weights), 5)
      if (allocated(error)) return

      print *, weights

      call check(error, maxval(weights), 24000)
      if (allocated(error)) return

      call check(error, solve_part_2(weights), 45000)
      if (allocated(error)) return

   end subroutine test_part_2

end module test_suite_1

program tester
   use, intrinsic :: iso_fortran_env, only: error_unit
   use testdrive, only: run_testsuite, new_testsuite, testsuite_type
   use test_suite_1, only: collect_suite1
   implicit none
   integer :: stat, is
   type(testsuite_type), allocatable :: testsuites(:)
   character(len=*), parameter :: fmt = '("#", *(1x, a))'

   stat = 0

   testsuites = [ &
                new_testsuite("suite1", collect_suite1) &
                ]

   do is = 1, size(testsuites)
      write (error_unit, fmt) "Testing:", testsuites(is)%name
      call run_testsuite(testsuites(is)%collect, error_unit, stat)
   end do

   if (stat > 0) then
      write (error_unit, '(i0, 1x, a)') stat, "test(s) failed!"
      error stop
   end if

end program tester

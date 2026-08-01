! Smoke test for the Fortran toolchain: checks that amdflang builds an OpenMP
! target region, that the region actually executes on the GPU rather than
! falling back to the host, and that the Fortran runtime works inside it.
program offload_check
  use omp_lib
  implicit none

  integer, parameter :: n = 1000000
  real(8), parameter :: tol = 1.0d-9
  real(8), allocatable :: a(:), b(:), c(:)
  real(8) :: checksum, expected
  logical :: ran_on_device
  integer :: i

  if (omp_get_num_devices() < 1) then
     print '(a)', 'FAILED: no OpenMP offload device found'
     stop 1
  end if

  ran_on_device = .false.
  !$omp target map(from: ran_on_device)
  ran_on_device = .not. omp_is_initial_device()
  !$omp end target

  if (.not. ran_on_device) then
     print '(a)', 'FAILED: target region fell back to the host'
     stop 1
  end if

  allocate (a(n), b(n), c(n))
  a = 1.0d0
  b = 2.0d0
  c = 0.0d0

  !$omp target teams distribute parallel do map(to: a, b) map(from: c)
  do i = 1, n
     c(i) = a(i) + 3.0d0*b(i)
  end do

  checksum = sum(c)
  expected = 7.0d0*n

  if (abs(checksum - expected) > tol*expected) then
     print '(a,es22.15,a,es22.15)', 'FAILED: got ', checksum, ', expected ', expected
     stop 1
  end if

  deallocate (a, b, c)

  print '(a,i0,a)', 'PASSED: offloaded to device 0 of ', omp_get_num_devices(), ' available'
end program offload_check

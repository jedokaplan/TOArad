program calctoarad

! gfortran -ffree-line-length-none -o calctoarad parametersmod.f90 orbitmod.f90 calctoarad.f90

use parametersmod, only : sp,dp
use orbitmod, only : orbitpars,calcorbitpars,toa_insolation

implicit none

integer  :: year
real(dp) :: lat
real(sp) :: rad
real(sp) :: dayl
real(sp) :: delta
integer  :: d

type(orbitpars) :: orbit

write(*,*)'Enter the calendar year before present (AD 1950)'

read(*,*)year

call calcorbitpars(year,orbit)

write(*,*)'the orbital parameters are',orbit

write(*,*)'enter the latitude'

read(*,*)lat

write(*,*)'DOY, rad (W m2), day (h), declination (deg)'

do d = 1,365

  call toa_insolation(orbit,d,lat,rad,dayl,delta)

  write(*,'(i4,f12.1,f9.1,f14.1)')d,rad/86400.*1000.,dayl,delta
  
end do

end program calctoarad
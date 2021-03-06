c
c
      subroutine sigalloc
      implicit integer (i-n), real*8 (a-h,o-z)
      include 'param.h'
      include 'comm.h'
cdir$ nobounds

c..................................................................
c     A check on allocations is sucessful entering then exiting
c     the subroutine.
c..................................................................
      write(*,*)'sigalloc:  Entering sigalloc'


 
      msig=0
      do 10 i=1,6
        msig=msig+isigmas(i)
 10   continue

      jxis=(jx*(jx+1))/2
      mtab=mtaba

c.......................................................................
c     Allocate allocatable arrays for sigma-v modules
c.......................................................................
      
      lnln=jxis*(mmsv+1)*msig
      lntab=mtab

      lndumsg=lnln+lntab

      allocate(csv(jxis,0:mmsv,msig),STAT=istat)
      allocate(svtab(mtab),STAT=istat)
      allocate(tamm1(0:mmsv),STAT=istat)
      allocate(iind(jx),STAT=istat)
      call bcast(csv,zero,SIZE(csv))
      call bcast(svtab,zero,SIZE(svtab))
      call bcast(tamm1,zero,SIZE(tamm1))
      call ibcast(iind,0,SIZE(iind))

      write(*,*)'sigalloc:  Leaving sigalloc'

      return
      end

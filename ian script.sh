#!/bin/bash
MYDIR="$(dirname "$(which "$0")")"

subOutput=$(qsub $MYDIR/md_build.pbs)
jobID=${subOutput%%.nottingham.ac.uk}
echo Submitted md_build.pbs
echo Job ID: "$jobID"
sleep 5
echo waiting for job to finish...
while qstat | fgrep "$jobID" >/dev/null
do
  sleep 1
done

subOutput=$(qsub $MYDIR/md_heat.pbs)
jobID=${subOutput%%.nottingham.ac.uk}
echo Submitted md_heat.pbs
echo Job ID: "$jobID"
sleep 5
echo waiting for job to finish...
while qstat | fgrep "$jobID" >/dev/null
do
  sleep 1
done

subOutput=$(qsub $MYDIR/md_equil.pbs)
jobID=${subOutput%%.nottingham.ac.uk}
sleep 5
echo Submitted md_equil.pbs
echo Job ID: "$jobID"
echo waiting for job to finish...
while qstat | fgrep "$jobID" >/dev/null
do
  sleep 1
done

subOutput=$(qsub $MYDIR/md_run.pbs)
jobID=${subOutput%%.nottingham.ac.uk}
echo Submitted md_run.pbs
echo Job ID: "$jobID"
sleep 5
echo waiting for job to finish...
while qstat | fgrep "$jobID" >/dev/null
do
  sleep 1
done

subOutput=$(qsub $MYDIR/md_quasi.pbs)
jobID=${subOutput%%.nottingham.ac.uk}
echo Submitted md_quasi.pbs
echo Job ID: "$jobID"
sleep 5
echo waiting for job to finish...
while qstat | fgrep "$jobID" >/dev/null
do
  sleep 1
done

subOutput=$(qsub $MYDIR/rmsd.pbs)
jobID=${subOutput%%.nottingham.ac.uk}
echo Submitted rmsd.pbs
echo Job ID: "$jobID"
sleep 5
echo waiting for job to finish...
while qstat | fgrep "$jobID" >/dev/null
do
  sleep 1
done

subOutput=$(qsub $MYDIR/phipsi.pbs)
jobID=${subOutput%%.nottingham.ac.uk}
echo Submitted phipsi.pbs
echo Job ID: "$jobID"
sleep 5
echo waiting for job to finish...
while qstat | fgrep "$jobID" >/dev/null
do
  sleep 1
done


echo done!

sched=findResource('scheduler', 'type', 'mpiexec')                           
set(sched, 'SubmitArguments', '--comm=pmi')                                   
set(sched, 'MpiexecFileName', '/usr/bin/mpiexec')
set(sched, 'EnvironmentSetMethod', 'setenv')                                  
matlabpool (sched, 8)  

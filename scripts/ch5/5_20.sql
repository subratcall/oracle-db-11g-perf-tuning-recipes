select event, sum(P3), sum(seconds_in_wait) seconds_in_wait
     from v$session_wait
     where event like 'latch%'
     group by event;

select wait_class, event, time_waited / 100 time_secs
     from v$system_event e
     where e.wait_class <> 'Idle' AND time_waited > 0
     union
     select 'Time Model', stat_name NAME,
     round ((value / 1000000), 2) time_secs
     from v$sys_time_model
     where stat_name not in ('background elapsed time', 'background cpu time')
     order by 3 desc;


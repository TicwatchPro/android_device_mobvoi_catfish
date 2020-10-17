#!/vendor/bin/sh

# move spi4 thread and nanohub thread into foreground cpuset to prevent them
# from stealing time from top app UIThread or RenderThread

PID=`pgrep -x spi4`
echo -n $PID > /dev/cpuset/foreground/tasks

PID=`pgrep -x nanohub`
echo -n $PID > /dev/cpuset/foreground/tasks

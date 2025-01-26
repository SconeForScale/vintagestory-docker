# vintagestory-docker
docker image for vintagestory

undocumented nonsense:
- the VSPATH env var is relative to an expected homedir at /home/USERNAME/, there is no way to specify an absolute path outside the homedir 
- expects a /var/vintagestory directory owned by USERNAME to exist 
- the start script launches the process in a screen and detaches, so you can't use it as an entrypoint nor do you get any useful logs to sdout
    - i just pull out the command and run it in the entrypoint but it's gona be sad if that ever changes in an update 

game developers man



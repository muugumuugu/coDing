# Particle Object
## attributes
* position
* velocity x=given , default =0,y=random -ve value
* acceleration
* lifespan = 255
* seedflag

## methods
* update
	vel+=acceleration
	pos+=velocity
	acc=0
* applyforce
	acc+=force // keeping mass =unit
* show
	if its not a seed firework map alpha with lifespan

# firework object
## attributes
* fwcompomemt// seed
* particles // non seeds
* exploded flag
* done flag
## methods
* update
	* fwcompomemt.applyforce(); // seed
	* fwcompomemt.update();
	* if fwcomponent reaches top, i.e, fwcompomemt.vel.y=0
		explode
	* if exploded,
		* update all particles, and decrement lifespan of particles
		* remove any particle with -ve lifespan
		* if particles.length=0, flag done
* show
	* if not exploded
		this.fwcompomemt.show();
	* show all its particles.
* exploded
	fill particles with particles at same location and random 2d velocity and seed flag=false


# fireworks array
* each frame, update all, show all
* loop thru backwords.
* delete any fireworkobject which is flagged done
* background brushing woth alpha so as to show trails
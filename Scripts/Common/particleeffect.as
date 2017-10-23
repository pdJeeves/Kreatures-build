

weakref<ParticleDatablock> sm_fireDB;
weakref<ParticleDatablock> sm_smokeDB;
weakref<ParticleEmitterDatablock> sm_fireEmitterDB;

ParticleDatablock@ GetSmokeDB()
{
	ParticleDatablock@ db = sm_smokeDB.get();

	if(db !is null)
		return db;

	@db = ParticleDatablock();
	@sm_smokeDB = db;
	
	db.life 		= 1;
	db.lifeVariance = 0;
	
	db.size          = 60;
	db.sizeVariance  = 0;
	
	db.gravityModifier = 0; //-.03;
	db.drag            = 0;
	db.mass			   = .01;
	db.massVariance    = 0;
	
	db.brown		   = 0;
	
	db.spinBegin	   = Angle::degrees(0);
	db.spinRange	   = Angle::degrees(0);
	db.spinSpeed       = 0;
	db.spinVariance    = 0;
	
	db.dropoff         = 1.2;
	
	db.randomFrame     = false;
	db.orient          = false;

	db.sizeOverTime.add(0, 1);
	db.sizeOverTime.add(1, 1);

	
	db.colorOverTime.add(0.0, Color(0x000000FF));
	
	return db;
}

ParticleDatablock@ GetFireDB()
{
	ParticleDatablock@ db = sm_fireDB.get();

	if(db !is null)
		return db;

	@db = ParticleDatablock();
	@sm_fireDB = db;
	
	db.life 		= 1;
	db.lifeVariance = .5;
	
	db.size          = 64;
	db.sizeVariance  = 0;
	
	db.gravityModifier = 0;
	db.drag            = 0;
	db.mass			   = .01;
	db.massVariance    = 0;
	
	db.brown		   = 0;
	
	db.spinBegin	   = Angle::degrees(0);
	db.spinRange	   = Angle::degrees(0);
	db.spinSpeed       = 0;
	db.spinVariance    = 0;
	
	db.dropoff         = .5;
	
	db.randomFrame     = false;
	db.orient          = false;
	
	db.fadeInRatio     = .3;
	db.fadeOutRatio    = .7;

	db.sizeOverTime.add(0, 1);
	db.sizeOverTime.add(1, 1);

	db.colorOverTime.add(0.0,  Color(0xFFFFFFFF));
	db.colorOverTime.add(1.0,  Color(0xFFFFFF00));
	
	db.secondaryColor.add(0.0,  Color(0xFFFFFFFF));
	db.secondaryColor.add(1.0,  Color(0xFFFFFFFF));
	
	return db;
}

ParticleEmitterDatablock@ GetFireEmitter()
{
	ParticleEmitterDatablock@ db = sm_fireEmitterDB.get();

	if(db !is null)
		return db;

	@db = ParticleEmitterDatablock();
	@sm_fireEmitterDB = db;
	
	//@db.texture	  = ParticleTexture("alpha", 0);
		
	db.life			= 10;
	db.lifeVariance	= 0;
	
	db.rate			= 10;
	db.rateVariance	= 2;
	
	db.angle        	= Angle::degrees(360);
	db.radius       	= 0;
	db.radiusVariance 	= 0;
	
	db.force            = 1;
	db.forceVariance    = .0;
	
	db.blending		    = GL::add;
	db.srcFactor		= GL::srcAlpha;
	db.dstFactor		= GL::invSrcAlpha;
	
	db.bursting          = false;
	db.distanceBasedLife = false;
	db.distanceBasedRate = false;
	db.infiniteLoop      = true;
	db.alphaErosion      = false;
	
	db.startingColor.add(0.0,  Color(0xFFFFFFFF));
	db.startingColor.add(1.0,  Color(0xFFFFFFFF));
	
	db.add(GetFireDB());
	
	return db;
}


class FireEffect : GameObject
{
	FireEffect(Anchor anchor, Point2F offset, Angle angle = Angle())
	{
		super(Components::BasicMovement | Components::ParticleEffect);
		processingTicks = true;		
		movement().setPosition(anchor, offset, angle);
	
		EmitterComponent @emitter = cast<EmitterComponent>(render());
		render().drawOrder = 500;
		@emitter.datablock = GetFireEmitter();
		emitter.emitting = true;
		
		emitter.datablock.edit();
	}
};



 
 class CreatureBase : GameObject
 {
 protected SkellComponent @m_skell;
 
 	CreatureBase(Anchor anchor, Point2F offset)
 	{
		super(Components::BasicMovement 
			| Components::Genome 
			| Components::Skell 
			| Components::Physics 
			| Components::Collision);
		
		catagory = Catagory::Creature;
		canCarry = true;
		
		genome().load("Eggs/ron.egg");
		genome().paused = true;
				
	
		physics().elasticity = .12;
		physics().friction = 1;
		physics().mass = 20;
		
		physics().respondToPhysicalZones = true; 
		processingTicks = true;	
		
		@m_skell = cast<SkellComponent>(render());	
		m_skell.scale = Point2F(.5, .5);
		m_skell.direction = 2;
		//m_skell.pose = Catalogue::getIndex("Pose List", "Normal 2");
		m_skell.walk();

		movement().setPosition(anchor, offset);
 	} 
 
 }

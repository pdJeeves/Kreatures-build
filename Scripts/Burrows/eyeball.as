 

class EyeBall : GameObject 
{
	EyeBall(Anchor anchor, Point2F offset) 
	{
		super(Components::BasicMovement 
			| Components::Sprite 
			| Components::Physics 
			| Components::Collision);
		
		catagory = Catagory::Toy;
		canCarry = true;
		
		SpriteComponent@ m_sprite = cast<SpriteComponent>(render());
		m_sprite.file = "eye_ball";
		m_sprite.drawOrder = 5000;
		
		movement().setPosition(anchor, offset);
	
		physics().elasticity = .25;
		physics().friction = .1;
		physics().mass = 1;
		
		physics().respondToPhysicalZones = true; 
		processingTicks = true;
	}
	
	void setVelocity(float x, float y)
	{
		physics().velocity = Point2F(x, y);
	}
}

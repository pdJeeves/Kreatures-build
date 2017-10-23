 

class ScreenTest : GameObject 
{
	ScreenTest(Anchor anchor, Point2F position, Point2F size, Angle angle = Angle()) 
	{
		super(Components::BasicMovement 
			| Components::Screen);

		render().drawOrder = 500;
		
		movement().setLocation(anchor, Box2F(position, size), angle);
	}
}

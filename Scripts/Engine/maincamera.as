
namespace Engine
{

class MainCamera  : GameObject
{
	void setPosition(Anchor anchor, Point2F pos)
	{
		Angle angle;
		movement().setPosition(anchor, pos, angle);
	}
}

MainCamera smMainCamera;

MainCamera@ getMainCamera() 
{
	return smMainCamera;
}

}


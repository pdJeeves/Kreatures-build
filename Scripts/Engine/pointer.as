
namespace Engine
{

class Pointer  : GameObject
{
	Pointer()
	{
//-----------------------------------------
// initialize sprite
//-----------------------------------------
		SpriteFile@ sprite = SpriteFile("system");
		
		if(sprite is null)
		{
			std::cout << "unable to load pointer sprite.\n";
		}
		
		sprite.addAnimation("click",  array<uint16> = {1, 0} );
		sprite.addAnimation("clack",  array<uint16> = {0, 1, 0} );
		sprite.addAnimation("pickup", array<uint16> = {7, 7, 6} );
		sprite.addAnimation("drop",   array<uint16> = {6, 7, 7, 7, 0} );
		
		sprite.addAnimation("tickle", array<uint16> = {2, 3, 2, 3, 2, 3, 0} );
		sprite.addAnimation("spank",  array<uint16> = {4, 5, 5, 0} );
		
		sprite.addAttachment("Pickup Point", Point2F = {30, 30}, 0, 7);
		sprite.addAttachment("Pivot", Point2F = {4, 4}, 0, 7);

//-----------------------------------------
// initialize pointer
//-----------------------------------------
		SpriteComponent@ m_sprite = cast<SpriteComponent>(render());
		
		m_sprite.file = "system";
		m_sprite.drawOrder = 32000;
				
		catagory = Catagory::Pointer;
	}
	
	void onLeftClick()
	{
		std::cout << "left click!\n";
	}	
	
	void onRightClick()
	{
		std::cout << "right click!\n";
	}
}

Pointer smThePointer;

Pointer@ getPointer() 
{
	return smThePointer;
}

}
 

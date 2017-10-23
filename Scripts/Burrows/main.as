Anchor CreateBurrows()
{
	Anchor buro = Anchor("Mansion");
//	buro.connect(buro, Direction::Left, 0);

	return buro;
}
/*
class MainCamera  : GameObject
{
	MainCamera()
	{
		super(Components::BasicMovement | Components::Camera);
	}
}

class Pointer  : GameObject
{
	Pointer()
	{
		super(Components::RelativeMovement | Components::Sprite | Components::Physics);
//-----------------------------------------
// initialize sprite
//-----------------------------------------
		Sprite@ sprite = Sprite("system");
		
		if(sprite is null)
		{
			std::cout << "unable to load pointer sprite.\n";
		}
		else if(sprite.noAnimations() == 0)
		{
			sprite.addAnimation("click",  array<uint16> = {1, 0} );
			sprite.addAnimation("clack",  array<uint16> = {0, 1, 0} );
			sprite.addAnimation("pickup", array<uint16> = {7, 7, 6} );
			sprite.addAnimation("drop",   array<uint16> = {6, 7, 7, 7, 0} );
		
			sprite.addAnimation("tickle", array<uint16> = {2, 3, 2, 3, 2, 3, 0} );
			sprite.addAnimation("spank",  array<uint16> = {4, 5, 5, 0} );
		
			sprite.addAttachment("Pickup Point", Point2F = {30, 30}, 0, 7);
			sprite.addAttachment("Pivot", Point2F = {4, 4}, 0, 7);
		}
		
//-----------------------------------------
// initialize pointer
//-----------------------------------------
		SpriteComponent@ m_sprite = cast<SpriteComponent>(render());
		
		m_sprite.file = "system";
		m_sprite.drawOrder = 60000;
				
		catagory = Catagory::Pointer;
	}
	
	async onLeftClick()
	{
		std::cout << "left click!\n";
	}	
	
	async onRightClick()
	{
		std::cout << "right click!\n";
	}
}

namespace ImGui
{

void ShowUserGuide()
{
    ImGui::BulletText("Double-click on title bar to collapse window.");
    ImGui::BulletText("Click and drag on lower right corner to resize window.");
    ImGui::BulletText("Click and drag on any empty space to move window.");
    ImGui::BulletText("Mouse Wheel to scroll.");
    
    ImGui::BulletText("TAB/SHIFT+TAB to cycle through keyboard editable fields.");
    ImGui::BulletText("CTRL+Click on a slider or drag box to input text.");
    ImGui::BulletText(
        "While editing text:\n"
        "- Hold SHIFT or use mouse to select text\n"
        "- CTRL+Left/Right to word jump\n"
        "- CTRL+A or double-click to select all\n"
        "- CTRL+X,CTRL+C,CTRL+V clipboard\n"
        "- CTRL+Z,CTRL+Y undo/redo\n"
        "- ESCAPE to revert\n"
        "- You can apply arithmetic operators +,*,/ on numerical values.\n"
        "  Use +- to subtract.\n");
}

}


class MainWindow : SDL_Window
{
	MainWindow()
	{
		super("Kreatures Window", Point2F = {800, 600}, 0);
		set_camera(MainCamera());
	}
	
	void onUpdate()
	{
		translate(get_mouseWheel() * -40);
		ImGui::ShowUserGuide();
	}
	
	void setPosition(Anchor anchor, Point2F pos)
	{
		Angle angle;
		get_camera().movement().setPosition(anchor, pos, angle);
	}
	
	void translate(Point2F pos)
	{
		MovementComponent@ movement = get_camera().movement();
		movement.set_position(movement.get_position() + pos);
	}
}

*/
void main()
{
//	MainWindow@ window = MainWindow();
//	window.setPosition(buro, Point2F = {580, 392});


	Anchor buro = CreateBurrows();
	Engine::getMainCamera().setPosition(buro, Point2F = {853, 2801});

//	ScreenTest(buro, Point2F = {600, 400}, Point2F = {400, 300});
	FireEffect(buro, Point2F = {500, 2801});
	
//	 CreatureBase@ ron = CreatureBase(buro, Point2F = {580,392});

 //   EyeBall@ eye = EyeBall(buro, Point2F = {170,496});
/*
	for(int i = 0; i < 1000; ++i)
	{
		EyeBall@ eye = EyeBall(buro, Point2F = {170,495});
		Angle angle = Angle::degrees(i);
		eye.setVelocity(1000*angle.sine, 1000*angle.cosine);
	}// 
//*/
}
 

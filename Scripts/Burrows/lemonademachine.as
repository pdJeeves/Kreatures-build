

class PinkLemonade : GameObject
{
	PinkLemonade(Anchor anchor, Point2F offset, Angle angle = Angle())
	{
		super(Components::BasicMovement | Components::Sprite);
		
		SpriteComponent@ m_sprite = cast<SpriteComponent>(render());
		m_sprite.file      = "pink_lemonade";
		m_sprite.frame     = 12;
		m_sprite.drawOrder = 1000;
		
		movement().setPosition(anchor, offset, angle);
	}
	
	void onPickedUp(GameObject@ it)
	{
		SpriteComponent@ m_sprite = cast<SpriteComponent>(render());
		m_sprite.frame     = 10;
	}
	
	void onDropped(GameObject@ it)
	{
		SpriteComponent@ m_sprite = cast<SpriteComponent>(render());
		m_sprite.frame     = 11 + (math::random() & 0x01);
	}
	
	void onEat(GameObject@ it)
	{
		GenomeComponent@ creature = it.genome();
	
		if(creature !is null)
		{
			creature.adjustChemical("hunger for fat", -.3);
			creature.adjustChemical("hunger for protien", -.2);
			creature.adjustChemical("fat", .105);
			creature.adjustChemical("protien", .105);
		}
		
//		playSound("drink.ogg");
		destroy();		
	}
}

class LemonadeMachine : GameObject
{
	LemonadeMachine(Anchor anchor, Point2F offset, Angle angle = Angle())
	{
		super(Components::BasicMovement | Components::Sprite);

		SpriteFile@ machine = SpriteFile("pink_lemonade");
		
		if(machine.noAnimations() == 0)
		{
			machine.addAnimation("dispanse", array<uint16> =  {0, 1, 2, 3, 4, 5, 6, 7, 8, 9}, .064);
			machine.addAttachment("dispense", Point2F = { machine.size(0).x/4, machine.size(0).y - machine.size(12).y}, 9);
		}
				
		canClick = true;
		
		SpriteComponent@ m_sprite = cast<SpriteComponent>(render());
		m_sprite.file      = "pink_lemonade";
		m_sprite.drawOrder = 500;
		
		movement().setPosition(anchor, offset, angle);
	}

	void onClick(GameObject@ hand, Point2F pos) 
	{
		onPushed(hand);
	}
	
	void onPushed(GameObject@ it) 
	{
		processingTicks = true;
		
		SpriteComponent@ m_sprite = cast<SpriteComponent>(render());
		m_sprite.play("dispense");
		m_sprite.over();
		
		PinkLemonade(movement().toAnchor(), m_sprite.attachment("dispsense"), movement().angle);
		processingTicks = false;
	}

}

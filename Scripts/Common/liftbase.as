
	funcdef void LiftCall(CallButtonBase@);
	
class CallButtonBase : GameObject
{
private LiftBase@ m_lift;

    CallButtonBase(LiftBase@ lift, Anchor anchor, Point2F offset, Angle angle = Angle())
    {
        super(Components::Sprite | Components::BasicMovement);
        canClick = true;
        
        catagory = Catagory::Button;

        @m_lift = lift;
        movement().setPosition(anchor, offset, angle);
    }

    void onDestroy()
    {
        m_lift.destroy();
    }
    
    bool activated()   { return false; };
    void onArrived()
    {
    
    }
    
    void onClick(Point2F pos) final
    {
        onPushed(null);
    }
    
    void onPushed(GameObject@ it)
    {
//        if(activated())      message(LiftCall(m_lift.called), varargs = {@this}, 2.0);
    }
}

class LiftBase : GameObject
{
private int     state;
private int     floor;
private Point2F target;
private array<CallButtonBase@> buttons;
    
    LiftBase(Anchor anchor, Point2F offset, Angle angle = Angle())
    {
        super(Components::CompoundSprite | Components::BasicMovement | Components::Physics | Components::Cabin);
        
        state    = 0;
        floor    = 0;
        
        catagory = Catagory::Lift;
        
    }
    
    void onDestroy()
    {
        for(uint i = 0; i < buttons.length; ++i)
        {
            buttons[i].destroy();
        }
        
        buttons.length = 0;
    }
    
    void called(CallButtonBase@ button)
    {        
    }

}


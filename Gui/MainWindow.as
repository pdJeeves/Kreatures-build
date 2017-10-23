 
 
class GuiWindow
{


	void update(float dt)
	{
	
	}
}
 
class MainWindow : SDL_Window
{
	MainWindow()
	{
		SDLWindow("Lifandi", {640, 480});
		
		if(!restoreState())
		{
			setPosition(Anchor::get("buro"), {0, 0} )
		}	
	}
	
	void update(float dt)
	{
	
	
	
	}
}

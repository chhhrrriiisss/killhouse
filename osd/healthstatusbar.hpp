class RscPicture {
	type = CT_STATIC;
	idc = -1;
	style = ST_PICTURE;
	colorBackground[] = {0,0,0,1};//{red, green, blue, Transparent}
	font = "PuristaMedium"; //FontM//PuristaMedium//TahomaB
	sizeEx = 0;

};

// class RscText {
// 	idc = -1;
// 	type = CT_STATIC;
// 	style = ST_CENTER;
// 	font = "PuristaMedium";
// 	sizeEx = 0.05;	
// };

class RscTitles 
{	
	name = "test"; // Name in Editor
	idd=-1;
	movingEnable = true;
	colorBackground[] = {0,0,0,1};//{red, green, blue, Transparent}
	titles[] ={health, flagStatus};

	// class flagStatus
	// {
	// 	idd=20010;
	// 	movingEnable = false;
	// 	duration=6; // Fade Duration
	// 	fadein=0; // Fade Time
	// 	name = "flagStatus"; // Name in Editor
	// 	controls[]={Text};
	// 	fadeOut = 0;
	// 	onLoad = "";

	// 	class Text : RscText {
	// 		x = 1.325; // X-Axis dex-six
	// 		y = -0.24;// Y-Axis su-giu
	// 		w = 0.30; //WindowWidth
	// 		h = 0.01; //Window Height
	// 		colorText[] = {255, 255, 255, 1};
	// 		colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
	// 		text = "HELLO WORLD!"; // Graphic Direction
	// 		sizeEx = 0.05;
	// 		style=48;
	// 	};
	// };

	class health100
	{
		idd=-1;
		movingEnable = true;
		duration=6; // Fade Duration
		fadein=0; // Fade Time
		name = "health100"; // Name in Editor
		controls[]={Picture};
		class Picture : RscPicture
		{
			x = 1.325; // X-Axis dex-six
			y = -0.24;// Y-Axis su-giu
			w = 0.30; //WindowWidth
			h = 0.01; //Window Height
			ColorText[]={0,0.5,0.8,0.8}; // COLOUR
			text = "OSD\health.jpg"; // Graphic Direction
			sizeEx = 0.01;
			style=48;
		};
	};

	class health90
	{
		idd=-1;
		movingEnable = true;
		duration=6; // Fade Duration
		fadein=0; // Fade Time
		name = "health90"; // Name in Editor
		controls[]={Picture};
		class Picture : RscPicture
		{
			x = 1.325; // X-Axis dex-six
			y = -0.24;// Y-Axis su-giu
			w = 0.27; //WindowWidth
			h = 0.01; //Window Height
			ColorText[]={0,0.5,0.8,0.8}; // COLOUR
			text = "OSD\health.jpg"; // Graphic Direction
			sizeEx = 0.01;
			style=48;
		};
	};

class health80
	{
		idd=-1;
		movingEnable = true;
		duration=6; // Fade Duration
		fadein=0; // Fade Time
		name = "health80"; // Name in Editor
		controls[]={Picture};
		class Picture : RscPicture
		{
			x = 1.325; // X-Axis dex-six
			y = -0.24;// Y-Axis su-giu
			w = 0.24; //WindowWidth
			h = 0.01; //Window Height
			ColorText[]={0,0.3,0.9,0.8}; //{red, green, blue, Transparent}
			text = "OSD\health.jpg"; // Graphic Direction
			sizeEx = 0.01;
			style=48;
		};
	};
       
class health70
	{
		idd=-1;
		movingEnable = true;
		duration=6; // Fade Duration
		fadein=0; // Fade Time
		name = "health70"; // Name in Editor
		controls[]={Picture};
		class Picture : RscPicture
		{
			x = 1.325; // X-Axis dex-six
			y = -0.24;// Y-Axis su-giu
			w = 0.21; //WindowWidth
			h = 0.01; //Window Height
			ColorText[]={0,0.2,1,0.8}; // COLOUR
			text = "OSD\health.jpg"; // Graphic Direction
			sizeEx = 0.01;
			style=48;
		};
	};


       
class health60
	{
		idd=-1;
		movingEnable = true;
		duration=6; // Fade Duration
		fadein=0; // Fade Time
		name = "health60"; // Name in Editor
		controls[]={Picture};
		class Picture : RscPicture
		{
			x = 1.325; // X-Axis dex-six
			y = -0.24;// Y-Axis su-giu
			w = 0.18; //WindowWidth
			h = 0.01; //Window Height
			ColorText[]={0,0.1,1,0.8}; // COLOUR
			text = "OSD\health.jpg"; // Graphic Direction
			sizeEx = 0.01;
			style=48;
		};
	};
       
class health50
	{
		idd=-1;
		movingEnable = true;
		duration=6; // Fade Duration
		fadein=0; // Fade Time
		name = "health50"; // Name in Editor
		controls[]={Picture};
		class Picture : RscPicture
		{
			x = 1.325; // X-Axis dex-six
			y = -0.24;// Y-Axis su-giu
			w = 0.15; //WindowWidth
			h = 0.01; //Window Height
			ColorText[]={1,0.1,0,0.8}; // COLOUR
			text = "OSD\health.jpg"; // Graphic Direction
			sizeEx = 0.01;
			style=48;
		};
	};
class health40
	{
		idd=-1;
		movingEnable = true;
		duration=6; // Fade Duration
		fadein=0; // Fade Time
		name = "health40"; // Name in Editor
		controls[]={Picture};
		class Picture : RscPicture
		{
			x = 1.325; // X-Axis dex-six
			y = -0.24;// Y-Axis su-giu
			w = 0.12; //WindowWidth
			h = 0.01; //Window Height
			ColorText[]={1,0,0,0.8}; // COLOUR
			text = "OSD\health.jpg"; // Graphic Direction
			sizeEx = 0.01;
			style=48;
		};
	};
class health30
	{
		idd=-1;
		movingEnable = true;
		duration=6; // Fade Duration
		fadein=0; // Fade Time
		name = "health30"; // Name in Editor
		controls[]={Picture};
		class Picture : RscPicture
		{
			x = 1.325; // X-Axis dex-six
			y = -0.24;// Y-Axis su-giu
			w = 0.09; //WindowWidth
			h = 0.01; //Window Height
			ColorText[]={1,0,0,0.8}; // COLOUR
			text = "OSD\health.jpg"; // Graphic Direction
			sizeEx = 0.01;
			style=48;
		};
	};
class health20
	{
		idd=-1;
		movingEnable = true;
		duration=6; // Fade Duration
		fadein=0; // Fade Time
		name = "health20"; // Name in Editor
		controls[]={Picture};
		class Picture : RscPicture
		{
			x = 1.325; // X-Axis dex-six
			y = -0.24;// Y-Axis su-giu
			w = 0.06; //WindowWidth
			h = 0.01; //Window Height
			ColorText[]={0,0,1,0.8}; // COLOUR
			text = "OSD\health.jpg"; // Graphic Direction
			sizeEx = 0.01;
			style=48;
		};
	};
class health10
	{
		idd=-1;
		movingEnable = true;
		duration=6; // Fade Duration
		fadein=0; // Fade Time
		name = "health10"; // Name in Editor
		controls[]={Picture};
		class Picture : RscPicture
		{
			x = 1.325; // X-Axis dex-six
			y = -0.24;// Y-Axis su-giu
			w = 0.03; //WindowWidth
			h = 0.01; //Window Height
			ColorText[]={0,0,1,0.8}; // COLOUR
			text = "OSD\health.jpg"; // Graphic Direction
			sizeEx = 0.01;
			style=48;
		};
	};
class health0
	{
		idd=-1;
		movingEnable = true;
		duration=6; // Fade Duration
		fadein=0; // Fade Time
		name = "health0"; // Name in Editor
		controls[]={Picture};
		class Picture : RscPicture
		{
			x = 1.325; // X-Axis dex-six
			y = -0.24;// Y-Axis su-giu
			w = 0; //WindowWidth
			h = 0.01; //Window Height
			ColorText[]={0,0,1,0.8}; // COLOUR
			text = "OSD\health.jpg"; // Graphic Direction
			sizeEx = 0.01;
			style=48;
		};
	};
class chealth100
	{
		idd=-1;
		movingEnable = true;
		duration=6; // Fade Duration
		fadein=0; // Fade Time
		name = "chealth100"; // Name in Editor
		controls[]={Picture};
		class Picture : RscPicture
		{
			x = 0.960; // X-Axis dex-six
			y = -0.24;// Y-Axis su-giu
			w = 0.30; //WindowWidth
			h = 0.01; //Window Height
			ColorText[]={0,0.5,0.8,0.8}; // COLOUR
			text = "OSD\health.jpg"; // Graphic Direction
			sizeEx = 0.01;
			style=48;
		};
	};


	class chealth90
	{
		idd=-1;
		movingEnable = true;
		duration=6; // Fade Duration
		fadein=0; // Fade Time
		name = "chealth90"; // Name in Editor
		controls[]={Picture};
		class Picture : RscPicture
		{
			x = 0.960; // X-Axis dex-six
			y = -0.24;// Y-Axis su-giu
			w = 0.27; //WindowWidth
			h = 0.01; //Window Height
			ColorText[]={0,0.5,0.8,0.8}; // COLOUR
			text = "OSD\health.jpg"; // Graphic Direction
			sizeEx = 0.01;
			style=48;
		};
	};

class chealth80
	{
		idd=-1;
		movingEnable = true;
		duration=6; // Fade Duration
		fadein=0; // Fade Time
		name = "chealth80"; // Name in Editor
		controls[]={Picture};
		class Picture : RscPicture
		{
			x = 0.960; // X-Axis dex-six
			y = -0.24;// Y-Axis su-giu
			w = 0.24; //WindowWidth
			h = 0.01; //Window Height
			ColorText[]={0,0.3,0.9,0.8}; //{red, green, blue, Transparent}
			text = "OSD\health.jpg"; // Graphic Direction
			sizeEx = 0.01;
			style=48;
		};
	};
       
class chealth70
	{
		idd=-1;
		movingEnable = true;
		duration=6; // Fade Duration
		fadein=0; // Fade Time
		name = "chealth70"; // Name in Editor
		controls[]={Picture};
		class Picture : RscPicture
		{
			x = 0.960; // X-Axis dex-six
			y = -0.24;// Y-Axis su-giu
			w = 0.21; //WindowWidth
			h = 0.01; //Window Height
			ColorText[]={0,0.2,1,0.8}; // COLOUR
			text = "OSD\health.jpg"; // Graphic Direction
			sizeEx = 0.01;
			style=48;
		};
	};


       
class chealth60
	{
		idd=-1;
		movingEnable = true;
		duration=6; // Fade Duration
		fadein=0; // Fade Time
		name = "chealth60"; // Name in Editor
		controls[]={Picture};
		class Picture : RscPicture
		{
			x = 0.960; // X-Axis dex-six
			y = -0.24;// Y-Axis su-giu
			w = 0.18; //WindowWidth
			h = 0.01; //Window Height
			ColorText[]={0,0.1,1,0.8}; // COLOUR
			text = "OSD\health.jpg"; // Graphic Direction
			sizeEx = 0.01;
			style=48;
		};
	};
       
class chealth50
	{
		idd=-1;
		movingEnable = true;
		duration=6; // Fade Duration
		fadein=0; // Fade Time
		name = "chealth50"; // Name in Editor
		controls[]={Picture};
		class Picture : RscPicture
		{
			x = 0.960; // X-Axis dex-six
			y = -0.24;// Y-Axis su-giu
			w = 0.15; //WindowWidth
			h = 0.01; //Window Height
			ColorText[]={1,0.1,0,0.8}; // COLOUR
			text = "OSD\health.jpg"; // Graphic Direction
			sizeEx = 0.01;
			style=48;
		};
	};
class chealth40
	{
		idd=-1;
		movingEnable = true;
		duration=6; // Fade Duration
		fadein=0; // Fade Time
		name = "chealth40"; // Name in Editor
		controls[]={Picture};
		class Picture : RscPicture
		{
			x = 0.960; // X-Axis dex-six
			y = -0.24;// Y-Axis su-giu
			w = 0.12; //WindowWidth
			h = 0.01; //Window Height
			ColorText[]={1,0,0,0.8}; // COLOUR
			text = "OSD\health.jpg"; // Graphic Direction
			sizeEx = 0.01;
			style=48;
		};
	};
class chealth30
	{
		idd=-1;
		movingEnable = true;
		duration=6; // Fade Duration
		fadein=0; // Fade Time
		name = "chealth30"; // Name in Editor
		controls[]={Picture};
		class Picture : RscPicture
		{
			x = 0.960; // X-Axis dex-six
			y = -0.24;// Y-Axis su-giu
			w = 0.09; //WindowWidth
			h = 0.01; //Window Height
			ColorText[]={1,0,0,0.8}; // COLOUR
			text = "OSD\health.jpg"; // Graphic Direction
			sizeEx = 0.01;
			style=48;
		};
	};
class chealth20
	{
		idd=-1;
		movingEnable = true;
		duration=6; // Fade Duration
		fadein=0; // Fade Time
		name = "chealth20"; // Name in Editor
		controls[]={Picture};
		class Picture : RscPicture
		{
			x = 0.960; // X-Axis dex-six
			y = -0.24;// Y-Axis su-giu
			w = 0.06; //WindowWidth
			h = 0.01; //Window Height
			ColorText[]={0,0,1,0.8}; // COLOUR
			text = "OSD\health.jpg"; // Graphic Direction
			sizeEx = 0.01;
			style=48;
		};
	};
class chealth10
	{
		idd=-1;
		movingEnable = true;
		duration=6; // Fade Duration
		fadein=0; // Fade Time
		name = "chealth10"; // Name in Editor
		controls[]={Picture};
		class Picture : RscPicture
		{
			x = 0.960; // X-Axis dex-six
			y = -0.24;// Y-Axis su-giu
			w = 0.03; //WindowWidth
			h = 0.01; //Window Height
			ColorText[]={0,0,1,0.8}; // COLOUR
			text = "OSD\health.jpg"; // Graphic Direction
			sizeEx = 0.01;
			style=48;
		};
	};

};



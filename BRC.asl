/************************** Created by Austin 'Auddy' Davenport *************************
********************** Special thanks to Loomeh, Yellow, and Sooldy *********************
*************************** Last Updated: August 30th, 2023 ****************************/

	/*	Bomb Rush Cyberfunk Autoplitter & Load Remover
		Stage IDs
			255 main menu
			8 = Prologue
			5 = Hideout
			4 = Versum Hill
			11 = Millennium Square
			12 = Brink Terminal
			6 = Millennium Mall
			7 = Mataan
			9 = Pyramid Island
		Objective IDs
			CH1
			0 = Prologue - EscapePoliceStation
			1 = Hideout - Join the BOMB RUSH CREW
			2 = Versum Hill - Do graffiti for Rep and challenge the FRANKS for info on DJ Cyber
			3 = Dream 1 - Find a way to wake up from the dream.
			CH2
			4 = Millennium Square - Head to Millennium Square to face ECLIPSE.
			5 = Millennium Square & Brink Terminal - Get REP and challenge ECLIPSE on their home turf.
			6 = Dream 2 - 
			CH3
			7 = Millennium Mall - BeatDotExe
			8 = Dream 3 - Do it.
			CH4
			15 = Versum Hill - SearchForPrinceVersum
			16 = Millennium Square - SearchForPrinceSquare
			17 = Brink Terminal - SearchForPrinceBrink
			18 = Mataan - SearchForPrinceMataan
			9 = Pyramid Island - BeatSamurai
			10 = Dream 4
			CH5
			11 = Beat FUTURISM in Mataan.
			12 = Dream 5
			13 = FinalBoss
			CH6
			14 = Hang out
			19 = MAX
	*/
		 
state("Bomb Rush Cyberfunk")
{
	// Working on these versions:
	// Version 1.0.19735 (original release)
	// Version 1.0.19864 (patch 1 8/30/2023)
	byte stageID : "UnityPlayer.dll", 0x01ADBA40, 0x30, 0x50, 0x28, 0x28, 0x70, 0x10, 0xBC;
	byte objectiveID : "UnityPlayer.dll", 0x01ADBA40, 0x30, 0x50, 0x28, 0x90, 0x70, 0x28, 0x58;
	byte sbHealth : "mono-2.0-bdwgc.dll", 0x0072A200, 0xFF8, 0x20, 0x48, 0x40, 0x20, 0x80;
	bool loading : "UnityPlayer.dll", 0x01ADBA40, 0x68, 0x20, 0x140, 0x0, 0x120, 0x30, 0x57;
}

init
{
	// Set initial values
	vars.gameMode = 0;	// Set the game mode to None = 0, Any% = 1, Glitchless = 2
}

startup
{
	settings.CurrentDefaultParent = null;
	settings.Add("gameMode", true, "Game Modes");
	settings.SetToolTip("gameMode", "Do not uncheck this box");
	
	// Any%
	settings.CurrentDefaultParent = "gameMode";
	settings.Add("Any", true, "Any%");
	settings.SetToolTip("Any", "Check this Option if you want to run Any%");
	
	settings.CurrentDefaultParent = "Any";
	settings.Add("splitsAny", true, "Autosplitter");
	settings.SetToolTip("splitsAny", "Check this Option if you want to use the Autosplitting feature.  You can choose your Splits below");
	
	settings.CurrentDefaultParent = "splitsAny";
	settings.Add("stagesAny", true, "Stages");
	settings.SetToolTip("stagesAny", "Check this Option if you want to Autosplit on Stages");
	
	settings.CurrentDefaultParent = "stagesAny";
	settings.Add("prologueAny",false,"Prologue End / Hideout Start");
	settings.Add("hideoutAny",false,"Hideout Tutorial End / Versum Start");
	settings.Add("versumAny",false,"Versum Hill End / Dream Sequence 1 Start");
	settings.Add("chapter1Any",true,"Chapter 1 End");
	settings.Add("squareAny",false,"Millennium Square End / Brink Terminal Start");
	settings.Add("brinkAny",false,"Brink Terminal End / Dream Sequence 2 Start");
	settings.Add("chapter2Any",true,"Chapter 2 End");
	settings.Add("mallAny",false,"Millennium Mall End / Dream Sequence 3 Start");
	settings.Add("chapter3Any",true,"Chapter 3 End");
	settings.Add("prince1Any",false,"Flesh Prince Versum End");
	settings.Add("prince2Any",false,"Flesh Prince Millennium End");
	settings.Add("prince3Any",false,"Flesh Prince Brink End");
	settings.Add("prince4Any",false,"Flesh Prince Mataan End / Pyramid Island Start");
	settings.Add("pyramidAny",false,"Pyramid Island End / Dream Sequence 4 Start");
	settings.Add("chapter4Any",true,"Chapter 4 End");
	settings.Add("finalAny",true,"Final Boss");
	
	// Glitchless
	settings.CurrentDefaultParent = "gameMode";
	settings.Add("Glitchless", false, "Glitchless");
	settings.SetToolTip("Glitchless", "Check this Option if you want to run Glitchless");
	
	settings.CurrentDefaultParent = "Glitchless";
	settings.Add("splitsGlitchless", true, "Autosplitter");
	settings.SetToolTip("splitsGlitchless", "Check this Option if you want to use the Autosplitting feature.  You can choose your Splits below");
	
	settings.CurrentDefaultParent = "splitsGlitchless";
	settings.Add("stagesGlitchless", true, "Stages");
	settings.SetToolTip("stagesGlitchless", "Check this Option if you want to Autosplit on Stages");
	
	settings.CurrentDefaultParent = "stagesGlitchless";
	settings.Add("prologueGlitchless",false,"Prologue End / Hideout Start");
	settings.Add("hideoutGlitchless",false,"Hideout Tutorial End / Versum Start");
	settings.Add("versumGlitchless",false,"Versum Hill End / Dream Sequence 1 Start");
	settings.Add("chapter1Glitchless",true,"Chapter 1 End");
	settings.Add("squareGlitchless",false,"Millennium Square End / Brink Terminal Start");
	settings.Add("brinkGlitchless",false,"Brink Terminal End / Dream Sequence 2 Start");
	settings.Add("chapter2Glitchless",true,"Chapter 2 End");
	settings.Add("mallGlitchless",false,"Millennium Mall End / Dream Sequence 3 Start");
	settings.Add("chapter3Glitchless",true,"Chapter 3 End");
	settings.Add("prince1Glitchless",false,"Flesh Prince Versum End");
	settings.Add("prince2Glitchless",false,"Flesh Prince Millennium End");
	settings.Add("prince3Glitchless",false,"Flesh Prince Brink End");
	settings.Add("prince4Glitchless",false,"Flesh Prince Mataan End / Pyramid Island Start");
	settings.Add("pyramidGlitchless",false,"Pyramid Island End / Dream Sequence 4 Start");
	settings.Add("chapter4Glitchless",true,"Chapter 4 End");
	settings.Add("mataanGlitchless",true,"Mataan End / Dream Sequence 5 Start");
	settings.Add("endgameGlitchless",true,"Dream Sequence 5 End / Endgame Start");
	settings.Add("finalGlitchless",true,"Final Boss");
}

start
{
	// Settings for New Game start Any%
	if(current.stageID == 8 && old.stageID == 255 && settings["Any"])
	{
		vars.gameMode = 1;	// Set game mode
		return true;
	}
	
	// Settings for New Game start Glitchless
	if(current.stageID == 8 && old.stageID == 255 && settings["Glitchless"])
	{
		vars.gameMode = 2;	// Set game mode
		return true;
	}
}

split
{
	// Any%
	if((vars.gameMode == 1) &&
	((current.stageID == 5 && old.stageID == 8) && settings["prologueAny"])
	||
	((current.stageID == 4 && old.stageID == 5 && current.objectiveID == 2) && settings["hideoutAny"])
	||
	((current.stageID == 4 && current.objectiveID == 3 && old.objectiveID == 2) && settings["versumAny"])
	||
	((current.stageID == 5 && old.stageID == 4 && current.objectiveID == 4) && settings["chapter1Any"])
	||
	((current.stageID == 12 && old.stageID == 11 && current.objectiveID == 5) && settings["squareAny"])
	||
	((current.stageID == 12 && current.objectiveID == 6 && old.objectiveID == 5) && settings["brinkAny"])
	||
	((current.stageID == 5 && old.stageID == 12 && current.objectiveID == 7) && settings["chapter2Any"])
	||
	((current.stageID == 6 && current.objectiveID == 8 && old.objectiveID == 7) && settings["mallAny"])
	||
	((current.stageID == 5 && old.stageID == 6 && current.objectiveID == 15) && settings["chapter3Any"])
	||
	((current.stageID == 4 && current.objectiveID == 16 && old.objectiveID == 15) && settings["prince1Any"])
	||
	((current.stageID == 11 && current.objectiveID == 17 && old.objectiveID == 16) && settings["prince2Any"])
	||
	((current.stageID == 12 && current.objectiveID == 18 && old.objectiveID == 17) && settings["prince3Any"])
	||
	((current.stageID == 5 && old.stageID == 7 && current.objectiveID == 9) && settings["prince4Any"])
	||
	((current.stageID == 9 && current.objectiveID == 10 && old.objectiveID == 9) && settings["pyramidAny"])
	||
	((current.stageID == 5 && old.stageID == 9 && current.objectiveID == 11) && settings["chapter4Any"])
	||
	((current.stageID == 7 && current.sbHealth == 0 && old.sbHealth == 1) && settings["finalAny"]))
	{
		return true;
	}
	
	// Glitchless
	if((vars.gameMode == 2) &&
	((current.stageID == 5 && old.stageID == 8) && settings["prologueGlitchless"])
	||
	((current.stageID == 4 && old.stageID == 5 && current.objectiveID == 2) && settings["hideoutGlitchless"])
	||
	((current.stageID == 4 && current.objectiveID == 3 && old.objectiveID == 2) && settings["versumGlitchless"])
	||
	((current.stageID == 5 && old.stageID == 4 && current.objectiveID == 4) && settings["chapter1Glitchless"])
	||
	((current.stageID == 12 && old.stageID == 11 && current.objectiveID == 5) && settings["squareGlitchless"])
	||
	((current.stageID == 12 && current.objectiveID == 6 && old.objectiveID == 5) && settings["brinkGlitchless"])
	||
	((current.stageID == 5 && old.stageID == 12 && current.objectiveID == 7) && settings["chapter2Glitchless"])
	||
	((current.stageID == 6 && current.objectiveID == 8 && old.objectiveID == 7) && settings["mallGlitchless"])
	||
	((current.stageID == 5 && old.stageID == 6 && current.objectiveID == 15) && settings["chapter3Glitchless"])
	||
	((current.stageID == 4 && current.objectiveID == 16 && old.objectiveID == 15) && settings["prince1Glitchless"])
	||
	((current.stageID == 11 && current.objectiveID == 17 && old.objectiveID == 16) && settings["prince2Glitchless"])
	||
	((current.stageID == 12 && current.objectiveID == 18 && old.objectiveID == 17) && settings["prince3Glitchless"])
	||
	((current.stageID == 5 && old.stageID == 7 && current.objectiveID == 9) && settings["prince4Glitchless"])
	||
	((current.stageID == 9 && current.objectiveID == 10 && old.objectiveID == 9) && settings["pyramidGlitchless"])
	||
	((current.stageID == 5 && old.stageID == 9 && current.objectiveID == 11) && settings["chapter4Glitchless"])
	||
	((current.stageID == 7 && current.objectiveID == 12 && old.objectiveID == 11) && settings["mataanGlitchless"])
	||
	((current.stageID == 7 && current.objectiveID == 13 && old.objectiveID == 12) && settings["endgameGlitchless"])
	||
	((current.stageID == 7 && current.sbHealth == 0 && old.sbHealth == 1) && settings["finalGlitchless"]))
	{
		return true;
	}
}

isLoading
{
	// Loading screens
	return current.loading;
}

reset
{
	// Reset if we are on the Main Menu
	if(current.stageID == 255 && old.stageID == 255 && current.loading)
	{
		vars.gameMode = 0;
		return true;
	}
}

exit
{
    // pauses the timer if the game crashes
	timer.IsGameTimePaused = true;
}

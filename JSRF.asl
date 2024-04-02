/************************** Created by Austin 'Auddy' Davenport *************************
************************ Special thanks to the JSRF Modding Team ************************
*************************** Last Updated: April 1st, 2024 ***************************/

//  Jet Set Radio Future Timer

state("cxbxr-ldr")					// Emulator state
{
	int cutscene : 0x1E69D0;		// Enemy defeat / End of Any% & PJ%
	ushort mission : 0x27B1C4;		// The mission number
	int igt : 0x27B1CC;				// The In Game Timer
}

state("cxbx")						// Emulator state
{
	int cutscene : 0x1E69D0;		// Enemy defeat / End of Any% & PJ%
	ushort mission : 0x27B1C4;		// The mission number
	int igt : 0x27B1CC;				// The In Game Timer
}

state("jsrf_data_container")		// Xbox state
{
	int changeCount : 0x7A20;		// Change count
	ushort cutscene: 0x7A26;		// Cutscenes
	ushort mission : 0x7A24;		// The mission number
	int igt : 0x7A2C;				// The In Game Timer
}

init
{
	// Set initial values
	vars.gameMode = 0;	// Set the game mode to None = 0, Any% = 1, Souls% = 2 , PJ% = 3, PJ% Glitchless = 4
}

startup
{
	settings.CurrentDefaultParent = null;
	settings.Add("gameMode",true, "Game Modes");
	settings.SetToolTip("gameMode", "Do not uncheck this box");
	
	// Any%
	settings.CurrentDefaultParent = "gameMode";
	settings.Add("Any", true, "Any%");
	settings.SetToolTip("Any", "Check this Option if you want to run Any% (39 total splits)");
	
	settings.CurrentDefaultParent = "Any";
	settings.Add("splitsAny", true, "Autosplitter");
	settings.SetToolTip("splitsAny", "Check this Option if you want to use the Autosplitting feature.  You can choose your Splits below");
	
	settings.CurrentDefaultParent = "splitsAny";
	settings.Add("missionsAny", true, "Missions");
	settings.SetToolTip("missionsAny", "Check this Option if you want to Autosplit on Missions");
	
	settings.CurrentDefaultParent = "missionsAny";
	settings.Add("garageAny",true,"Garage");
	settings.Add("beatAny",false,"Beat Race Start");
	settings.Add("dogenAny",true,"Dogenzaka Hill");
	settings.Add("comboAny",false,"Combo Challenge Start");
	settings.Add("shibuyaAny",true,"Shibuya Terminal");
	settings.Add("tanksAny",false,"Tanks/Hayashi Fight");
	settings.Add("chuoAny",true,"Chuo Street");
	settings.Add("rdhCopsAny",false,"RDH Cop Fight");
	settings.Add("rdhAny",true,"Rokkaku Dai Heights");
	settings.Add("99LightAny",false,"99th Light Side Cops");
	settings.Add("99RapidAny",false,"Rapid 99 Race Start");
	settings.Add("99Any",true,"99th Street");
	settings.Add("sewersAny",true,"Sewers");
	settings.Add("bottomAny",true,"Bottom Point");
	settings.Add("hikageTerrorAny",false,"Terror Drone Fight");
	settings.Add("hikageCopsAny",false,"Left & Right Cop Fights (2 Splits)");
	settings.Add("hikageAny",true,"Hikage Street");
	settings.Add("kiboAny",true,"Kibogaoka Hill");
	settings.Add("sdppCopsAny",false,"SDPP Cop Fight");
	settings.Add("sdppAny",true,"Skyscraper District");
	settings.Add("highwayAny",true,"Highway Zero");
	settings.Add("doomAny",false,"Doom Riders Race");
	settings.Add("immortalsAny",false,"Immortals Race");
	settings.Add("deathballAny",true,"Death Ball");
	settings.Add("noiseDogenAny",false,"Noise Tank Cleanup Dogen");
	settings.Add("noiseShibuyaAny",false,"Noise Tank Cleanup Shibuya");
	settings.Add("noiseChuoAny",false,"Noise Tank Cleanup Chuo");
	settings.Add("noiseRDHAny",false,"Noise Tank Cleanup RDH");
	settings.Add("noiseAny",true,"Noise Tank Cleanup");
	settings.Add("skydinoAny",true,"Sky Dinosaurian Square");
	settings.Add("frzBlueAny",false,"FRZ Blue Devices");
	settings.Add("frzRedAny",false,"FRZ Red Devices");
	settings.Add("frzAny",true,"Fortified Residential Zone");
	settings.Add("clawAny",true,"Claw");
	settings.Add("flameAny",true,"Flame");
	settings.Add("trainAny",true,"Train");
	settings.Add("zerobeatAny",true,"Zero Beat");
	settings.Add("akumuAny",true,"A.KU.MU (always active)");
	
	// Souls%
	settings.CurrentDefaultParent = "gameMode";
	settings.Add("Souls", false, "Souls%");
	settings.SetToolTip("Souls", "Check this Option if you want to run Souls% (43 total splits)");
	
	settings.CurrentDefaultParent = "Souls";
	settings.Add("splitsSouls", true, "Autosplitter");
	settings.SetToolTip("splitsSouls", "Check this Option if you want to use the Autosplitting feature.  You can choose your Splits below");
	
	settings.CurrentDefaultParent = "splitsSouls";
	settings.Add("missionsSouls", true, "Missions");
	settings.SetToolTip("missionsSouls", "Check this Option if you want to Autosplit on splits");
	
	settings.CurrentDefaultParent = "missionsSouls";
	settings.Add("garageSouls",true,"Garage");
	settings.Add("beatSouls",false,"Beat Race Start");
	settings.Add("dogenSouls",true,"Dogenzaka Hill");
	settings.Add("comboSouls",false,"Combo Challenge Start");
	settings.Add("shibuyaSouls",true,"Shibuya Terminal");
	settings.Add("tanksSouls",false,"Tanks/Hayashi Fight");
	settings.Add("chuoSouls",true,"Chuo Street");
	settings.Add("rdhCopsSouls",false,"RDH Cop Fight");
	settings.Add("rdhSouls",true,"Rokkaku Dai Heights");
	settings.Add("99LightSouls",false,"99th Light Side Cops");
	settings.Add("99RapidSouls",false,"Rapid 99 Race Start");
	settings.Add("99Souls",true,"99th Street");
	settings.Add("sewersSouls",true,"Sewers");
	settings.Add("bottomSouls",true,"Bottom Point");
	settings.Add("hikageTerrorSouls",false,"Terror Drone Fight");
	settings.Add("hikageCopsSouls",false,"Left & Right Cop Fights (2 Splits)");
	settings.Add("hikageSouls",true,"Hikage Street");
	settings.Add("kiboSouls",true,"Kibogaoka Hill");
	settings.Add("kiboOption2Souls",false,"Kibogaoka Hill (Sewers Option 2)");
	settings.Add("sewersOption2Souls",false,"Sewers (Option 2)");
	settings.Add("sdppCopsSouls",false,"SDPP Cop Fight");
	settings.Add("sdppSouls",true,"Skyscraper District");
	settings.Add("highwaySouls",true,"Highway Zero");
	settings.Add("doomSouls",false,"Doom Riders Race");
	settings.Add("immortalsSouls",false,"Immortals Race");
	settings.Add("deathballSouls",true,"Death Ball");
	settings.Add("noiseDogenSouls",false,"Noise Tank Cleanup Dogen");
	settings.Add("noiseShibuyaSouls",false,"Noise Tank Cleanup Shibuya");
	settings.Add("noiseChuoSouls",false,"Noise Tank Cleanup Chuo");
	settings.Add("noiseRDHSouls",false,"Noise Tank Cleanup RDH");
	settings.Add("noiseSouls",true,"Noise Tank Cleanup");
	settings.Add("skydinoSouls",true,"Sky Dinosaurian Square");
	settings.Add("frzBlueSouls",false,"FRZ Blue Devices");
	settings.Add("frzRedSouls",false,"FRZ Red Devices");
	settings.Add("frzSouls",true,"Fortified Residential Zone");
	settings.Add("clawSouls",true,"Claw");
	settings.Add("frz2Souls",true,"Fortified Residential Zone 2");
	settings.Add("frz2Option3Souls",false,"Fortified Residential Zone 2 (Sewers Option 3)");
	settings.Add("sewersOption3Souls",false,"Sewers (Option 3)");
	settings.Add("flameSouls",true,"Flame");
	settings.Add("trainSouls",true,"Train");
	settings.Add("zerobeatSouls",true,"Zero Beat");
	settings.Add("akumuSouls",true,"A.KU.MU (always active)");
	
	// PJ%
	settings.CurrentDefaultParent = "gameMode";
	settings.Add("PJ", false, "PJ%");
	settings.SetToolTip("PJ", "Check this Option if you want to run PJ% (14 total splits)");
	
	settings.CurrentDefaultParent = "PJ";
	settings.Add("splitsPJ", true, "Autosplitter");
	settings.SetToolTip("splitsPJ", "Check this Option if you want to use the Autosplitting feature.  You can choose your Splits below");
	
	settings.CurrentDefaultParent = "splitsPJ";
	settings.Add("missionsPJ", true, "Missions");
	settings.SetToolTip("missionsPJ", "Check this Option if you want to Autosplit on Missions");
	
	settings.CurrentDefaultParent = "missionsPJ";
	settings.Add("garagePJ",true,"Garage");
	settings.Add("beatPJ",false,"Beat Race Start");
	settings.Add("dogenPJ",true,"Dogenzaka Hill");
	settings.Add("comboPJ",false,"Combo Challenge Start");
	settings.Add("shibuyaPJ",true,"Shibuya Terminal");
	settings.Add("tanksPJ",false,"Tanks/Hayashi Fight");
	settings.Add("chuoPJ",true,"Chuo Street");
	settings.Add("rdhCopsPJ",false,"RDH Cop Fight");
	settings.Add("rdhPJ",true,"Rokkaku Dai Heights");
	settings.Add("99LightPJ",false,"99th Light Side Cops");
	settings.Add("99RapidPJ",false,"Rapid 99 Race Start");
	settings.Add("99PJ",true,"99th Street");
	settings.Add("sewersPJ",true,"Sewers");
	settings.Add("bottomPJ",true,"Bottom Point (always active)");
	
	// PJ% Glitchless
	settings.CurrentDefaultParent = "gameMode";
	settings.Add("PJG", false, "PJ% Glitchless");
	settings.SetToolTip("PJG", "Check this Option if you want to run PJ% Glitchless (19 total splits)");
	
	settings.CurrentDefaultParent = "PJG";
	settings.Add("splitsPJG", true, "Autosplitter");
	settings.SetToolTip("splitsPJG", "Check this Option if you want to use the Autosplitting feature.  You can choose your Splits below");
	
	settings.CurrentDefaultParent = "splitsPJG";
	settings.Add("missionsPJG", true, "Missions");
	settings.SetToolTip("missionsPJG", "Check this Option if you want to Autosplit on Missions");
	
	settings.CurrentDefaultParent = "missionsPJG";
	settings.Add("garagePJG",true,"Garage");
	settings.Add("beatPJG",false,"Beat Race Start");
	settings.Add("dogenPJG",true,"Dogenzaka Hill");
	settings.Add("comboPJG",false,"Combo Challenge Start");
	settings.Add("shibuyaPJG",true,"Shibuya Terminal");
	settings.Add("tanksPJG",false,"Tanks/Hayashi Fight");
	settings.Add("pjRacePJG",false,"PJ Race Start");
	settings.Add("chuoPJG",true,"Chuo Street");
	settings.Add("rdhCopsPJG",false,"RDH Cop Fights (all 3)");
	settings.Add("rdhPJG",true,"Rokkaku Dai Heights");
	settings.Add("99CopsPJG",false,"99th Cop Fights (Light & Dark Sides)");
	settings.Add("99RapidPJG",false,"Rapid 99 Race Start");
	settings.Add("99PJG",true,"99th Street");
	settings.Add("garamPJG",true,"Garam Challenge");
	settings.Add("sewersPJG",true,"Sewers");
	settings.Add("bottomPJG",true,"Bottom Point (always active)");
}

start
{
	// Settings for New Game start Any%
	if(((current.mission == 101 && old.mission == 65535) ||
	   (current.mission == 101 && current.changeCount != old.changeCount)) && settings["Any"]){
		vars.gameMode = 1;	// Set game mode
		return true;
	}
	
	// Settings for New Game start Souls%
	if(((current.mission == 101 && old.mission == 65535) ||
	   (current.mission == 101 && current.changeCount != old.changeCount)) && settings["Souls"]){
		vars.gameMode = 2;	// Set game mode
		return true;
	}
	
	// Settings for New Game start PJ%
	if(((current.mission == 101 && old.mission == 65535) ||
	   (current.mission == 101 && current.changeCount != old.changeCount)) && settings["PJ"]){
		vars.gameMode = 3;	// Set game mode
		return true;
	}
	
	// Settings for New Game start PJ% Glitchless
	if(((current.mission == 101 && old.mission == 65535) ||
	   (current.mission == 101 && current.changeCount != old.changeCount)) && settings["PJG"]){
		vars.gameMode = 4;	// Set game mode
		return true;
	}
}

gameTime
{
	// In Game Time
	if(current.igt != old.igt && vars.gameMode != 0 && vars.gameMode < 5){
		return TimeSpan.FromSeconds(current.igt*.01666666666666666666666666666667);
	}
}

isLoading
{
	// Loading screens
	if(current.igt == old.igt){
		return true;
	}
}

split
{
	// Any%
	if((vars.gameMode == 1) &&
	(((current.mission == 196 && old.mission == 1) || (current.mission == 196 && old.mission == 101)) && settings["garageAny"])
	||
	((current.mission == 112 && old.mission == 110) && settings["beatAny"])
	||
	((current.mission == 120 && old.mission == 100) && settings["dogenAny"])
	||
	((current.mission == 123 && old.mission == 121) && settings["comboAny"])
	||
	((current.mission == 296 && old.mission == 122) && settings["shibuyaAny"])
	||
	((current.mission == 230 && old.mission == 231) && settings["tanksAny"])
	||
	((current.mission == 240 && old.mission == 200) && settings["chuoAny"])
	||
	((current.mission == 240 && old.mission == 241) && settings["rdhCopsAny"])
	||
	((current.mission == 250 && old.mission == 200) && settings["rdhAny"])
	||
	((current.mission == 250 && old.mission == 251) && settings["99LightAny"])
	||
	((current.mission == 252 && old.mission == 250) && settings["99RapidAny"])
	||
	((current.mission == 396 && old.mission == 252) && settings["99Any"])
	||
	((current.mission == 370 && old.mission == 360) && settings["sewersAny"])
	||
	((current.mission == 496 && old.mission == 370) && settings["bottomAny"])
	||
	((current.mission == 450 && old.mission == 451) && settings["hikageTerrorAny"])
	||
	((current.mission == 450 && old.mission == 452) && settings["hikageCopsAny"])
	||
	((current.mission == 460 && old.mission == 430) && settings["hikageAny"])
	||
	((current.mission == 470 && old.mission == 440) && settings["kiboAny"])
	||
	((current.mission == 470 && old.mission == 471) && settings["sdppCopsAny"])
	||
	((current.mission == 480 && old.mission == 470) && settings["sdppAny"])
	||
	((current.mission == 596 && old.mission == 480) && settings["highwayAny"])
	||
	((current.mission == 510 && old.mission == 511) && settings["doomAny"])
	||
	((current.mission == 510 && old.mission == 512) && settings["immortalsAny"])
	||
	((current.mission == 696 && old.mission == 514) && settings["deathballAny"])
	||
	((current.mission == 610 && old.mission == 620) && settings["noiseDogenAny"])
	||
	((current.mission == 615 && old.mission == 610) && settings["noiseShibuyaAny"])
	||
	((current.mission == 630 && old.mission == 600) && settings["noiseChuoAny"])
	||
	((current.mission == 655 && old.mission == 600) && settings["noiseRDHAny"])
	||
	((current.mission == 660 && old.mission == 675) && settings["noiseAny"])
	||
	((current.mission == 796 && old.mission == 660) && settings["skydinoAny"])
	||
	(((current.mission == 750 && current.cutscene == 2064 && old.cutscene == 1040) || (current.mission == 750 && current.cutscene == 83 && old.cutscene == 82)) && settings["frzBlueAny"])
	||
	((current.mission == 752 && old.mission == 750) && settings["frzRedAny"])
	||
	((current.mission == 896 && old.mission == 751) && settings["frzAny"])
	||
	((current.mission == 870 && old.mission == 875) && settings["clawAny"])
	||
	((current.mission == 880 && old.mission == 875) && settings["flameAny"])
	||
	((current.mission == 898 && old.mission == 880) && settings["trainAny"])
	||
	((current.mission == 811 && old.mission == 812) && settings["zerobeatAny"])
	||
	(((current.mission == 890 && current.cutscene == 80 && old.cutscene == 48) || (current.mission == 890 && current.cutscene == 102 && old.cutscene == 101)) && settings["akumuAny"])
	){
		return true;
	}
	
	// Souls%
	if((vars.gameMode == 2) &&
	(((current.mission == 196 && old.mission == 1) || (current.mission == 196 && old.mission == 101)) && settings["garageSouls"])
	||
	((current.mission == 112 && old.mission == 110) && settings["beatSouls"])
	||
	(((current.mission == 120 && old.mission == 100) || (current.mission == 120 && old.mission == 110)) && settings["dogenSouls"])
	||
	((current.mission == 123 && old.mission == 121) && settings["comboSouls"])
	||
	((current.mission == 296 && old.mission == 122) && settings["shibuyaSouls"])
	||
	((current.mission == 230 && old.mission == 231) && settings["tanksSouls"])
	||
	((current.mission == 240 && old.mission == 200) && settings["chuoSouls"])
	||
	((current.mission == 240 && old.mission == 241) && settings["rdhCopsSouls"])
	||
	((current.mission == 250 && old.mission == 200) && settings["rdhSouls"])
	||
	((current.mission == 250 && old.mission == 251) && settings["99LightSouls"])
	||
	((current.mission == 252 && old.mission == 250) && settings["99RapidSouls"])
	||
	((current.mission == 396 && old.mission == 252) && settings["99Souls"])
	||
	((current.mission == 370 && old.mission == 360) && settings["sewersSouls"])
	||
	((current.mission == 496 && old.mission == 370) && settings["bottomSouls"])
	||
	((current.mission == 450 && old.mission == 451) && settings["hikageTerrorSouls"])
	||
	((current.mission == 450 && old.mission == 452) && settings["hikageCopsSouls"])
	||
	((current.mission == 460 && old.mission == 430) && settings["hikageSouls"])
	||
	((current.mission == 470 && old.mission == 440) && settings["kiboSouls"])
	||
	((current.mission == 430 && old.mission == 460) && settings["kiboOption2Souls"])
	||
	((current.mission == 470 && old.mission == 440) && settings["sewersOption2Souls"])
	||
	((current.mission == 470 && old.mission == 471) && settings["sdppCopsSouls"])
	||
	((current.mission == 480 && old.mission == 470) && settings["sdppSouls"])
	||
	((current.mission == 596 && old.mission == 480) && settings["highwaySouls"])
	||
	((current.mission == 510 && old.mission == 511) && settings["doomSouls"])
	||
	((current.mission == 510 && old.mission == 512) && settings["immortalsSouls"])
	||
	((current.mission == 696 && old.mission == 514) && settings["deathballSouls"])
	||
	((current.mission == 610 && old.mission == 620) && settings["noiseDogenSouls"])
	||
	((current.mission == 615 && old.mission == 610) && settings["noiseShibuyaSouls"])
	||
	((current.mission == 630 && old.mission == 600) && settings["noiseChuoSouls"])
	||
	((current.mission == 655 && old.mission == 600) && settings["noiseRDHSouls"])
	||
	((current.mission == 660 && old.mission == 675) && settings["noiseSouls"])
	||
	((current.mission == 796 && old.mission == 660) && settings["skydinoSouls"])
	||
	(((current.mission == 750 && current.cutscene == 2064 && old.cutscene == 1040) || (current.mission == 750 && current.cutscene == 83 && old.cutscene == 82)) && settings["frzBlueSouls"])
	||
	((current.mission == 752 && old.mission == 750) && settings["frzRedSouls"])
	||
	((current.mission == 896 && old.mission == 751) && settings["frzSouls"])
	||
	((current.mission == 850 && old.mission == 835) && settings["clawSouls"])
	||
	(current.mission == 870 && old.mission == 875 && settings["frz2Souls"])
	||
	((current.mission == 835 && old.mission == 850) && settings["frz2Option3Souls"])
	||
	((current.mission == 870 && old.mission == 875) && settings["sewersOption3Souls"])
	||
	((current.mission == 880 && old.mission == 875) && settings["flameSouls"])
	||
	((current.mission == 898 && old.mission == 880) && settings["trainSouls"])
	||
	((current.mission == 811 && old.mission == 812) && settings["zerobeatSouls"])
	||
	(((current.mission == 890 && current.cutscene == 80 && old.cutscene == 48) || (current.mission == 890 && current.cutscene == 102 && old.cutscene == 101)) && settings["akumuSouls"])
	){
		return true;
	}
	
	// PJ%
	if((vars.gameMode == 3) &&
	(((current.mission == 196 && old.mission == 1) || (current.mission == 196 && old.mission == 101)) && settings["garagePJ"])
	||
	((current.mission == 112 && old.mission == 110) && settings["beatPJ"])
	||
	((current.mission == 120 && old.mission == 100) && settings["dogenPJ"])
	||
	((current.mission == 123 && old.mission == 121) && settings["comboPJ"])
	||
	((current.mission == 296 && old.mission == 122) && settings["shibuyaPJ"])
	||
	((current.mission == 230 && old.mission == 231) && settings["tanksPJ"])
	||
	((current.mission == 240 && old.mission == 200) && settings["chuoPJ"])
	||
	((current.mission == 240 && old.mission == 241) && settings["rdhCopsPJ"])
	||
	((current.mission == 250 && old.mission == 200) && settings["rdhPJ"])
	||
	((current.mission == 250 && old.mission == 251) && settings["99LightPJ"])
	||
	((current.mission == 252 && old.mission == 250) && settings["99RapidPJ"])
	||
	((current.mission == 396 && old.mission == 252) && settings["99PJ"])
	||
	((current.mission == 370 && old.mission == 360) && settings["sewersPJ"])
	||
	(((current.mission == 371 && current.cutscene == 16 && old.cutscene == 0) || (current.mission == 371 && current.cutscene == 65534 && old.cutscene == 65535)) && settings["bottomPJ"])
	){
		return true;
	}
	
	// PJ% Glitchless
	if((vars.gameMode == 4) &&
	(((current.mission == 196 && old.mission == 1) || (current.mission == 196 && old.mission == 101)) && settings["garagePJG"])
	||
	((current.mission == 112 && old.mission == 110) && settings["beatPJG"])
	||
	((current.mission == 120 && old.mission == 100) && settings["dogenPJG"])
	||
	((current.mission == 123 && old.mission == 121) && settings["comboPJG"])
	||
	((current.mission == 296 && old.mission == 122) && settings["shibuyaPJG"])
	||
	((current.mission == 230 && old.mission == 231) && settings["tanksPJG"])
	||
	((current.mission == 232 && old.mission == 230) && settings["pjRacePJG"])
	||
	((current.mission == 240 && old.mission == 200) && settings["chuoPJG"])
	||
	((current.mission == 240 && old.mission == 241) && settings["rdhCopsPJG"])
	||
	((current.mission == 250 && old.mission == 200) && settings["rdhPJG"])
	||
	((current.mission == 250 && old.mission == 251) && settings["99CopsPJG"])
	||
	((current.mission == 252 && old.mission == 250) && settings["99RapidPJG"])
	||
	((current.mission == 396 && old.mission == 252) && settings["99PJG"])
	||
	((current.mission == 360 && old.mission == 361) && settings["garamPJG"])
	||
	((current.mission == 370 && old.mission == 360) && settings["sewersPJG"])
	||
	(((current.mission == 371 && current.cutscene == 16 && old.cutscene == 0) || (current.mission == 371 && current.cutscene == 65534 && old.cutscene == 65535)) && settings["bottomPJG"])
	){
		return true;
	}
}

reset
{
	// Reset if we are on the Main Menu
	if(current.mission == 65535 && old.mission != 65535){
		vars.gameMode = 0;
		return true;
	}
}

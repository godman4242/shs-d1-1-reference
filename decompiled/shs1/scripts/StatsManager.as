package
{
   import flash.display.MovieClip;
   import flash.net.SharedObject;
   
   public class StatsManager
   {
      
      public static var instance:StatsManager;
      
      public var survivalMode:Boolean = false;
      
      public var hp:int = 10;
      
      public var battlesFought:int = 0;
      
      internal var patrolsDown:*;
      
      public var playerIcon:MovieClip;
      
      internal var tentSquash:Boolean = false;
      
      internal var banner2taken:Boolean = false;
      
      internal var totalArrowHeadShots:int = 0;
      
      internal var usedCheat:Boolean = false;
      
      internal var patrolsLoc:*;
      
      internal var hexState:*;
      
      internal var mission4init:Boolean = false;
      
      public var armor:int = 0;
      
      internal var root:*;
      
      public var banner4taken:Boolean = false;
      
      public var timing:int = 0;
      
      internal var patrolsLocOld:*;
      
      internal var engagedPatrol:* = -1;
      
      public var headshotCount:int = 0;
      
      internal var justLoadedData:Boolean = false;
      
      public var map:MovieClip;
      
      public var previousHp:int = 10;
      
      internal var banner1taken:Boolean = false;
      
      public var showAll:Boolean = false;
      
      internal var afterBoss:Boolean = false;
      
      internal var domination:Boolean = false;
      
      public var levels:*;
      
      internal var totalHeadshotCount:int = 0;
      
      public var maxHP:int = 3;
      
      public var arrowAmmo:int = 5;
      
      public var hexCheat:Boolean = false;
      
      public var turn:int = 1;
      
      internal var gateState:int = 1;
      
      public var maxCombo:int = 0;
      
      public var mission:int = 0;
      
      public var arrowCount:int = 0;
      
      public var slashCount:int = 0;
      
      public var bossDefeated:Boolean = false;
      
      public var banner3taken:Boolean = false;
      
      public var totalTiming:int = 0;
      
      public var arrowHeadShots:int = 0;
      
      public var location:int = 36;
      
      internal var patrolsDead:*;
      
      internal var totalScore:int = 0;
      
      public var skipFights:Boolean = false;
      
      public var banners:int = 0;
      
      public var previousLocation:int = 0;
      
      public var hasBow:Boolean = false;
      
      internal var totalLevels:int = 39;
      
      public var kills:int = 0;
      
      public var hexitemtaken:Boolean = false;
      
      public var totalItems:int = 0;
      
      public var totalBanners:int = 0;
      
      public var banner5taken:Boolean = false;
      
      internal var totalArrowCount:int = 0;
      
      internal var totalKills:int = 0;
      
      internal var totalDeaths:int = 0;
      
      internal var totalSlashCount:int = 0;
      
      public function StatsManager()
      {
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         hasBow = false;
         arrowAmmo = 5;
         previousHp = 10;
         armor = 0;
         maxHP = 3;
         location = 36;
         previousLocation = 0;
         showAll = false;
         skipFights = false;
         levels = new Array();
         mission = 0;
         totalLevels = 39;
         gateState = 1;
         tentSquash = false;
         afterBoss = false;
         usedCheat = false;
         survivalMode = false;
         hp = 10;
         timing = 0;
         slashCount = 0;
         arrowCount = 0;
         headshotCount = 0;
         banners = 0;
         kills = 0;
         arrowHeadShots = 0;
         maxCombo = 0;
         totalTiming = 0;
         totalSlashCount = 0;
         totalHeadshotCount = 0;
         totalArrowCount = 0;
         totalBanners = 0;
         totalScore = 0;
         totalKills = 0;
         totalArrowHeadShots = 0;
         totalDeaths = 0;
         battlesFought = 0;
         totalItems = 0;
         turn = 1;
         banner1taken = false;
         banner2taken = false;
         banner3taken = false;
         banner4taken = false;
         banner5taken = false;
         hexitemtaken = false;
         mission4init = false;
         hexState = new Array();
         hexCheat = false;
         bossDefeated = false;
         domination = false;
         justLoadedData = false;
         patrolsDown = new Array(false,true,false);
         patrolsDead = new Array(true,false,true,false,false,true,true,false,false,false,false,false,false,false);
         patrolsLoc = new Array(40,7,12,15,16,19,20,21,25,26,27,22,23,24);
         patrolsLocOld = new Array();
         engagedPatrol = -1;
         super();
         instance = this;
         new HexManager();
         _loc1_ = 0;
         while(_loc1_ <= totalLevels)
         {
            levels.push(new StatsLevel());
            _loc1_++;
         }
         _loc2_ = 0;
         while(_loc2_ <= 10)
         {
            hexState[_loc2_] = new Array();
            _loc3_ = 0;
            while(_loc3_ <= 11)
            {
               hexState[_loc2_][_loc3_] = new HexInfo(_loc2_,_loc3_);
               _loc3_++;
            }
            _loc2_++;
         }
         location = 36;
         levels[36].visited = true;
         levels[1].hasItem = true;
         levels[6].hasItem = true;
         levels[8].hasItem = true;
         levels[9].hasItem = true;
         levels[21].hasItem = true;
         levels[27].hasItem = true;
      }
      
      public function displayFriendlies() : *
      {
         var _loc1_:* = undefined;
         map.link_18_38.visible = false;
         map.circle38.visible = false;
         map.link_4_39.visible = false;
         map.circle39.visible = false;
         map.linkout1.visible = false;
         map.linkout2.visible = false;
         map.linkout3.visible = false;
         map.friendly1.visible = false;
         map.friendly2.visible = false;
         map.friendly3.visible = false;
         if(showAll)
         {
            levels[38].visited = true;
            levels[39].visited = true;
         }
         switch(turn)
         {
            case 24:
               map.linkout2.visible = true;
               map.link_4_39.visible = true;
               map.circle39.visible = true;
               map.friendly2.visible = true;
               map.friendly2.x = map.circle39.x;
               map.friendly2.y = map.circle39.y;
               break;
            case 25:
               map.linkout2.visible = true;
               map.link_4_39.visible = true;
               map.circle39.visible = true;
               map.friendly2.visible = true;
               map.friendly2.x = map.circle4.x;
               map.friendly2.y = map.circle4.y;
               patrolsDead[2] = true;
               break;
            case 26:
               map.linkout2.visible = true;
               map.link_4_39.visible = true;
               map.circle39.visible = true;
               map.friendly2.visible = true;
               map.friendly2.x = map.circle7.x;
               map.friendly2.y = map.circle7.y;
               patrolsDead[1] = true;
               break;
            case 27:
               map.linkout2.visible = true;
               map.link_4_39.visible = true;
               map.circle39.visible = true;
               map.friendly2.visible = true;
               map.friendly2.x = map.circle12.x;
               map.friendly2.y = map.circle12.y;
               break;
            case 28:
               map.linkout2.visible = true;
               map.link_4_39.visible = true;
               map.circle39.visible = true;
               map.friendly2.visible = true;
               map.friendly2.x = map.circle14.x;
               map.friendly2.y = map.circle14.y;
               break;
            case 29:
               map.linkout2.visible = true;
               map.link_4_39.visible = true;
               map.circle39.visible = true;
               map.friendly2.visible = true;
               map.friendly2.x = map.circle16.x;
               map.friendly2.y = map.circle16.y;
               map.linkout1.visible = true;
               map.link_18_38.visible = true;
               map.circle38.visible = true;
               map.friendly1.visible = true;
               map.friendly1.x = map.circle38.x;
               map.friendly1.y = map.circle38.y;
               map.linkout3.visible = true;
               map.friendly3.visible = true;
               map.friendly3.x = map.circle21.x;
               map.friendly3.y = map.circle21.y;
               patrolsDead[7] = true;
         }
         if(turn >= 30)
         {
            _loc1_ = 1;
            while(_loc1_ <= 7)
            {
               patrolsDead[_loc1_] = true;
               _loc1_++;
            }
            map.linkout2.visible = true;
            map.link_4_39.visible = true;
            map.circle39.visible = true;
            map.friendly2.visible = true;
            map.friendly2.x = map.circle19.x;
            map.friendly2.y = map.circle19.y;
            map.linkout1.visible = true;
            map.link_18_38.visible = true;
            map.circle38.visible = true;
            map.friendly1.visible = true;
            map.friendly1.x = map.circle18.x;
            map.friendly1.y = map.circle18.y;
            map.friendly1.scaleX = -1;
            map.linkout3.visible = true;
            map.friendly3.visible = true;
            map.friendly3.x = map.circle20.x;
            map.friendly3.y = map.circle20.y;
            map.friendly3.scaleX = -1;
         }
         if(!showAll)
         {
            map.linkout2.visible = false;
            map.link_4_39.visible = false;
            map.circle39.visible = false;
            map.linkout1.visible = false;
            map.link_18_38.visible = false;
            map.circle38.visible = false;
            map.linkout3.visible = false;
         }
      }
      
      public function getFriendlyLocation(param1:MovieClip) : int
      {
         if(param1.name == "friendly1")
         {
            if(turn == 29)
            {
               return 38;
            }
            if(turn >= 30)
            {
               return 18;
            }
         }
         else if(param1.name == "friendly2")
         {
            if(turn == 24)
            {
               return 39;
            }
            if(turn == 25)
            {
               return 4;
            }
            if(turn == 26)
            {
               return 7;
            }
            if(turn == 27)
            {
               return 12;
            }
            if(turn == 28)
            {
               return 14;
            }
            if(turn == 29)
            {
               return 16;
            }
            if(turn >= 30)
            {
               return 19;
            }
         }
         else if(param1.name == "friendly3")
         {
            if(turn == 29)
            {
               return 21;
            }
            if(turn >= 30)
            {
               return 20;
            }
         }
         return 0;
      }
      
      public function sumScore() : int
      {
         var _loc1_:int = 0;
         var _loc2_:* = undefined;
         _loc1_ = 0;
         _loc2_ = 0;
         while(_loc2_ <= totalLevels)
         {
            _loc1_ += levels[_loc2_].points + levels[_loc2_].stylePoints;
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function displayStats() : *
      {
         var _loc1_:* = undefined;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         map.gui.stats.achievementitem.visible = totalItems == 7;
         map.gui.stats.achievementbanner.visible = totalBanners == 7;
         map.gui.stats.achievementhex.visible = mission == 4 && countFriendlyHex() == countTotalHex();
         map.gui.stats.achievementmaxslash.visible = maxCombo >= 6;
         map.gui.stats.achievementarrowheadshot.visible = totalArrowHeadShots >= 20;
         map.gui.stats.achievementheadshot.visible = totalHeadshotCount >= 100;
         map.gui.stats.achievementkills.visible = totalKills >= 300;
         map.gui.stats.achievementfights.visible = battlesFought >= 30;
         map.gui.stats.achievementdeaths.visible = false;
         if(bossDefeated)
         {
            if(map.gui.stats.achievementitem.visible)
            {
               totalScore += 50000;
            }
            if(map.gui.stats.achievementbanner.visible)
            {
               totalScore += 50000;
            }
            if(map.gui.stats.achievementmaxslash.visible)
            {
               totalScore += 50000;
            }
            if(map.gui.stats.achievementarrowheadshot.visible)
            {
               totalScore += 50000;
            }
            if(map.gui.stats.achievementheadshot.visible)
            {
               totalScore += 50000;
            }
            if(map.gui.stats.achievementkills.visible)
            {
               totalScore += 50000;
            }
            if(map.gui.stats.achievementfights.visible)
            {
               totalScore += 50000;
            }
            if(totalDeaths == 0)
            {
               map.gui.stats.achievementdeaths.visible = true;
               totalScore += 50000;
            }
            totalScore += countFriendlyHex() * 10000;
            saveData();
         }
         map.gui.stats.visible = true;
         map.gui.stats.hp.text = hp;
         map.gui.stats.deflect.text = armor * 10;
         map.gui.stats.battles.text = battlesFought;
         _loc1_ = totalTiming / 24;
         _loc2_ = _loc1_ / 60;
         _loc3_ = _loc1_ % 60;
         map.gui.stats.timing.text = _loc2_ + " min " + _loc3_ + " sec";
         map.gui.stats.kills.text = totalKills;
         map.gui.stats.deaths.text = totalDeaths;
         map.gui.stats.score.text = totalScore;
         map.gui.stats.slashes.text = totalSlashCount;
         map.gui.stats.combo.text = maxCombo;
         map.gui.stats.headshots.text = totalHeadshotCount;
         map.gui.stats.arrows.text = totalArrowCount;
         map.gui.stats.arrowheadshots.text = totalArrowHeadShots;
         map.gui.stats.items.text = totalItems;
         map.gui.stats.banners.text = totalBanners;
         map.gui.stats.turns.text = turn;
         map.gui.stats.sectorlabel.visible = mission == 4;
         map.gui.stats.sectorcount.visible = mission == 4;
         map.gui.stats.sectortotal.visible = mission == 4;
         if(mission == 4)
         {
            map.gui.stats.sectorcount.text = countFriendlyHex();
            map.gui.stats.sectortotal.text = countTotalHex();
         }
         if(mission == 0)
         {
            map.gui.stats.mission.text = LangManager.getWords(26);
            map.gui.stats.objective.text = LangManager.getWords(27);
         }
         else if(mission == 1)
         {
            map.gui.stats.mission.text = LangManager.getWords(26);
            map.gui.stats.objective.text = LangManager.getWords(28);
         }
         else if(mission == 2)
         {
            map.gui.stats.mission.text = LangManager.getWords(26);
            map.gui.stats.objective.text = LangManager.getWords(29);
         }
         else if(mission == 3)
         {
            map.gui.stats.mission.text = LangManager.getWords(26);
            map.gui.stats.objective.text = LangManager.getWords(30) + (30 - turn) + LangManager.getWords(31);
         }
         else if(bossDefeated || afterBoss)
         {
            map.gui.stats.mission.text = LangManager.getWords(32);
            map.gui.stats.objective.text = LangManager.getWords(33);
         }
         else if(mission == 4)
         {
            map.gui.stats.mission.text = LangManager.getWords(34);
            map.gui.stats.objective.text = LangManager.getWords(35);
         }
      }
      
      public function nextTurn() : *
      {
         ++turn;
         if(showAll)
         {
            movePatrols();
         }
         StageManager.instance.updateColorCounter();
         if(getBuildersLeft() > 0 && gateState <= 28)
         {
            ++gateState;
         }
      }
      
      internal function getRowFromSerial(param1:int) : int
      {
         return (param1 - param1 % 12) / 12;
      }
      
      internal function playEnemyDialog() : Boolean
      {
         var _loc1_:int = 0;
         switch(location)
         {
            case 0:
               showEnemyDialog(LangManager.getWords(11));
               return true;
            case 4:
            case 7:
            case 12:
            case 14:
               _loc1_ = Math.random() * 5;
               if(_loc1_ == 0)
               {
                  showEnemyDialog(LangManager.getWords(12));
               }
               else if(_loc1_ == 1)
               {
                  showEnemyDialog(LangManager.getWords(13));
               }
               else if(_loc1_ == 2)
               {
                  showEnemyDialog(LangManager.getWords(14));
               }
               else if(_loc1_ == 3)
               {
                  showEnemyDialog(LangManager.getWords(15));
               }
               else if(_loc1_ == 4)
               {
                  showEnemyDialog(LangManager.getWords(16));
               }
               return true;
            case 15:
            case 16:
            case 17:
            case 18:
            case 19:
            case 20:
               _loc1_ = Math.random() * 5;
               if(_loc1_ == 0)
               {
                  showEnemyDialog(LangManager.getWords(12));
               }
               else if(_loc1_ == 1)
               {
                  showEnemyDialog(LangManager.getWords(13));
               }
               else if(_loc1_ == 2)
               {
                  showEnemyDialog(LangManager.getWords(14));
               }
               else if(_loc1_ == 3)
               {
                  showEnemyDialog(LangManager.getWords(15));
               }
               else if(_loc1_ == 4)
               {
                  showEnemyDialog(LangManager.getWords(16));
               }
               return true;
            case 22:
            case 23:
            case 24:
               if(getBuildersLeft() == 0 && mission == 2)
               {
                  showEnemyDialog(LangManager.getWords(17));
                  return true;
               }
               break;
            case 28:
               showEnemyDialog(LangManager.getWords(18));
               return true;
         }
         return false;
      }
      
      public function getPatrolLocation(param1:MovieClip) : *
      {
         var _loc2_:* = undefined;
         _loc2_ = 1;
         while(_loc2_ <= 13)
         {
            if(param1.name == "patrol" + _loc2_)
            {
               return patrolsLoc[_loc2_];
            }
            _loc2_++;
         }
      }
      
      public function showPlayerDialog(param1:String) : *
      {
         map.gui.playerdialog.playerdialog.words.text = param1;
         map.gui.playerdialog.gotoAndPlay(2);
      }
      
      public function getChanceToDeflect() : int
      {
         return armor * 10;
      }
      
      internal function getColFromSerial(param1:int) : int
      {
         return param1 % 12;
      }
      
      public function initSurvivalMode() : *
      {
         survivalMode = true;
         hasBow = true;
         arrowAmmo = 10;
         armor = 0;
         location = 102;
         hp = 10;
      }
      
      internal function getHexSerial(param1:int, param2:int) : int
      {
         return param1 * 12 + param2;
      }
      
      public function fireAtCamp() : *
      {
         tentSquash = true;
         SoundManager.instance.playCrash();
         map.tentsquash.gotoAndStop(2);
         displayCircles();
      }
      
      public function displayHP() : *
      {
         if(hp == 1)
         {
            MovieClip(Player.instance.parent.parent).healthbar.gotoAndStop(2);
         }
         MovieClip(Player.instance.parent.parent).healthbar.width = hp * 10;
         MovieClip(Player.instance.parent.parent).hptext.text = hp;
      }
      
      public function updateStats() : *
      {
         totalTiming += timing;
         totalSlashCount += slashCount;
         totalHeadshotCount += headshotCount;
         totalArrowCount += arrowCount;
         totalBanners += banners;
         totalKills += kills;
         totalArrowHeadShots += arrowHeadShots;
         stageReset();
      }
      
      public function initMission4() : *
      {
         var _loc1_:* = undefined;
         map.gui.strategymode.gotoAndPlay(2);
         map.gui.words.text = LangManager.getWords(25);
         mission4init = true;
         _loc1_ = 4;
         while(_loc1_ <= 7)
         {
            hexState[10][_loc1_].side = 2;
            hexState[10][_loc1_].strength = 6;
            _loc1_++;
         }
         hexState[10][4].hasPlayer = true;
         HexManager.heroLocation = hexState[10][4];
         hexState[1][4].side = 3;
         hexState[1][4].strength = 7;
         hexState[1][7].side = 3;
         hexState[1][7].strength = 7;
         hexState[3][4].side = 3;
         hexState[3][4].strength = 7;
         hexState[3][7].side = 3;
         hexState[3][7].strength = 7;
         hexState[2][5].side = 3;
         hexState[2][5].strength = 7;
         if(!tentSquash)
         {
            hexState[4][5].side = 3;
            hexState[4][5].strength = 7;
         }
         if(!patrolsDead[8])
         {
            hexState[7][4].side = 3;
            hexState[7][4].strength = 4;
         }
         if(!patrolsDead[9])
         {
            hexState[7][6].side = 3;
            hexState[7][6].strength = 4;
         }
         if(!patrolsDead[10])
         {
            hexState[7][8].side = 3;
            hexState[7][8].strength = 4;
         }
      }
      
      public function displayTurn() : *
      {
         map.gui.turnnumber.text = "TURN  " + turn;
      }
      
      public function hideMapMsg() : *
      {
         map.gui.maptextbox.textbox.text = "";
         map.gui.maptextbox.visible = false;
      }
      
      public function countTotalHex() : int
      {
         var _loc1_:int = 0;
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:Hex = null;
         _loc1_ = 0;
         _loc2_ = 0;
         while(_loc2_ <= 10)
         {
            _loc3_ = 0;
            while(_loc3_ <= 11)
            {
               _loc4_ = map.hexgrid.getChildByName("hex_" + _loc2_ + "_" + _loc3_);
               if(_loc4_ != null)
               {
                  _loc1_++;
               }
               _loc3_++;
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function fireAtGate() : *
      {
         SoundManager.instance.playCrash();
         if(gateState >= 25)
         {
            gateState = 19;
         }
         else if(gateState >= 15)
         {
            gateState = 10;
         }
         else
         {
            gateState = 1;
         }
         map.gate.gotoAndStop(gateState);
         map.link_18_22.visible = true;
         map.link_19_23.visible = true;
         map.link_20_24.visible = true;
         displayCircles();
      }
      
      public function bossDialogClick() : *
      {
         StatsManager.instance.location = 101;
         StatsManager.instance.map.transition.gotoAndPlay(25);
      }
      
      public function setRoot(param1:*) : *
      {
         this.root = param1;
      }
      
      public function playerDialogClick() : *
      {
         if(location == 28 && skipFights)
         {
            displayCircles();
            return;
         }
         if(location == 28)
         {
            map.transition.gotoAndPlay(25);
         }
         else if(mission == 4)
         {
            map.gui.hexdialog.visible = true;
         }
      }
      
      public function addScore(param1:int) : *
      {
         totalScore += param1;
         MovieClip(Player.instance.parent.parent).scoretext.text = "score  " + totalScore;
      }
      
      public function enemyDialogClick() : *
      {
         if(skipFights)
         {
            displayCircles();
            return;
         }
         map.transition.gotoAndPlay(25);
      }
      
      public function displayCircles() : *
      {
         var _loc1_:* = undefined;
         var _loc2_:MovieClip = null;
         var _loc3_:* = undefined;
         map.gui.introanim.visible = false;
         if(mission == 4)
         {
            displayTurn();
            displayHex();
            return;
         }
         stageEnd();
         movePlayerIcon();
         displayFriendlies();
         displayPatrol();
         displayTurn();
         displayObjective();
         map.hexgrid.visible = false;
         map.gui.endturnbutton.visible = false;
         map.gui.stratinstructionbtn.visible = false;
         map.newbanner.visible = banner1taken;
         map.newbanner2.visible = banner2taken;
         map.newbanner3.visible = false;
         map.newbanner4.visible = false;
         map.newbanner5.visible = false;
         map.newbanner6.visible = false;
         map.hexitem.visible = false;
         if(!showAll)
         {
            _loc1_ = 0;
            while(_loc1_ <= totalLevels)
            {
               _loc2_ = MovieClip(map.getChildByName("circle" + _loc1_));
               if(!levels[_loc1_].hasItem)
               {
                  _loc2_.chest.visible = false;
               }
               if(!levels[_loc1_].visited)
               {
                  _loc2_.visible = false;
               }
               _loc1_++;
            }
            _loc1_ = 0;
            while(_loc1_ <= totalLevels)
            {
               _loc3_ = 0;
               while(_loc3_ <= totalLevels)
               {
                  if(map.getChildByName("link_" + _loc1_ + "_" + _loc3_) != null)
                  {
                     if(!levels[_loc1_].visited && !levels[_loc3_].visited)
                     {
                        map.getChildByName("link_" + _loc1_ + "_" + _loc3_).visible = false;
                     }
                     else
                     {
                        map.getChildByName("link_" + _loc1_ + "_" + _loc3_).visible = true;
                     }
                     if(Boolean(levels[_loc1_].visited) || Boolean(levels[_loc3_].visited))
                     {
                        map.getChildByName("circle" + _loc1_).visible = true;
                        map.getChildByName("circle" + _loc3_).visible = true;
                     }
                  }
                  _loc3_++;
               }
               _loc1_++;
            }
         }
         else
         {
            _loc1_ = 0;
            while(_loc1_ <= totalLevels)
            {
               _loc2_ = MovieClip(map.getChildByName("circle" + _loc1_));
               if(!levels[_loc1_].hasItem)
               {
                  _loc2_.chest.visible = false;
               }
               _loc1_++;
            }
         }
         map.gate.gotoAndStop(gateState);
         if(gateState == 25)
         {
            if(location < 22)
            {
               showPlayerDialog(LangManager.getWords(8));
            }
            else
            {
               showPlayerDialog(LangManager.getWords(9));
            }
         }
         if(map.gate.currentFrame >= 7)
         {
            map.link_20_24.visible = false;
         }
         if(map.gate.currentFrame >= 15)
         {
            map.link_19_23.visible = false;
         }
         if(map.gate.currentFrame >= 25)
         {
            map.link_18_22.visible = false;
            map.link_21_28.visible = true;
            map.link_27_28.visible = true;
            map.circle28.visible = true;
         }
         else
         {
            map.link_21_28.visible = false;
            map.link_27_28.visible = false;
            map.circle28.visible = false;
         }
         if(tentSquash)
         {
            map.tentsquash.gotoAndStop(2);
         }
      }
      
      public function getItem() : *
      {
         map.gui.itemfounddialog.visible = true;
      }
      
      public function showMapMsg(param1:String) : *
      {
         map.gui.maptextbox.textbox.text = param1;
         map.gui.maptextbox.visible = false;
      }
      
      public function goTitleStage() : *
      {
         root.goTitleStage();
      }
      
      public function movePatrols() : *
      {
         var _loc1_:* = undefined;
         patrolsLocOld = patrolsLoc.slice();
         _loc1_ = 1;
         while(_loc1_ <= 2)
         {
            switch(patrolsLoc[_loc1_])
            {
               case 14:
                  patrolsDown[_loc1_] = true;
                  patrolsLoc[_loc1_] = 12;
                  break;
               case 12:
                  if(patrolsDown[_loc1_])
                  {
                     patrolsLoc[_loc1_] = 7;
                  }
                  else
                  {
                     patrolsLoc[_loc1_] = 14;
                  }
                  break;
               case 7:
                  if(patrolsDown[_loc1_])
                  {
                     patrolsLoc[_loc1_] = 4;
                  }
                  else
                  {
                     patrolsLoc[_loc1_] = 12;
                  }
                  break;
               case 4:
                  patrolsDown[_loc1_] = false;
                  patrolsLoc[_loc1_] = 7;
            }
            _loc1_++;
         }
         _loc1_ = 3;
         while(_loc1_ <= 6)
         {
            switch(patrolsLoc[_loc1_])
            {
               case 18:
                  patrolsLoc[_loc1_] = 15;
                  break;
               case 17:
                  patrolsLoc[_loc1_] = 20;
                  break;
               default:
                  if(patrolsLoc[_loc1_] < 17)
                  {
                     ++patrolsLoc[_loc1_];
                  }
                  else if(patrolsLoc[_loc1_] > 18)
                  {
                     --patrolsLoc[_loc1_];
                  }
            }
            _loc1_++;
         }
      }
      
      public function displayObjective() : *
      {
         map.objective0.visible = mission == 0;
         map.objective1.visible = mission == 1;
         map.objective2.visible = mission == 2;
         map.objective3.visible = mission == 2;
         map.objective4.visible = mission == 2;
         map.objective5.visible = mission == 4;
      }
      
      public function setMap(param1:MovieClip) : *
      {
         this.map = param1;
         if(mission == 4)
         {
            moveMap(630);
         }
         else if(location >= 5 && location <= 14)
         {
            moveMap(200);
         }
         else if(location >= 15 && location <= 17)
         {
            moveMap(400);
         }
         else if(location >= 18 && location <= 28)
         {
            moveMap(500);
         }
      }
      
      public function movePlayerIcon() : *
      {
         if(MovieClip(map.getChildByName("circle" + location)).x < MovieClip(map.getChildByName("circle" + previousLocation)).x)
         {
            playerIcon.scaleX = -1;
         }
         else
         {
            playerIcon.scaleX = 1;
         }
         playerIcon.x = MovieClip(map.getChildByName("circle" + location)).x;
         playerIcon.y = MovieClip(map.getChildByName("circle" + location)).y;
         if(location == 15)
         {
            map.playercanvas2.addChild(playerIcon);
         }
         else if(location == 13 || location >= 18)
         {
            map.playercanvas.addChild(playerIcon);
         }
         if(mission <= 1 && location == 13)
         {
            map.guardtower.gotoAndStop(3);
         }
      }
      
      public function checkPlayerMeetPatrols() : Boolean
      {
         var _loc1_:* = undefined;
         _loc1_ = 1;
         while(_loc1_ <= 13)
         {
            if((location == patrolsLoc[_loc1_] || location == patrolsLocOld[_loc1_]) && !patrolsDead[_loc1_])
            {
               patrolsDead[_loc1_] = true;
               engagedPatrol = _loc1_;
               return true;
            }
            _loc1_++;
         }
         engagedPatrol = -1;
         return false;
      }
      
      public function showEnemyDialog(param1:String) : *
      {
         map.gui.enemydialog.enemydialog.words.text = param1;
         map.gui.enemydialog.gotoAndPlay(2);
      }
      
      public function jumpToStrategyMode() : *
      {
         mission = 4;
         bossDefeated = false;
         hasBow = true;
         arrowAmmo = 5;
         hp = 15;
         gateState = 10;
         tentSquash = false;
         usedCheat = true;
      }
      
      public function transitionOut() : *
      {
         stageReset();
         root.overworldMode = false;
         root.goFightstage();
      }
      
      public function moveMap(param1:int) : *
      {
         map.y += param1;
         map.uparrow.y -= param1;
         map.downarrow.y -= param1;
         map.transition.y -= param1;
         map.gui.y -= param1;
         map.mask1.y -= param1;
         map.mask2.y -= param1;
         map.mask3.y -= param1;
      }
      
      public function saveData() : *
      {
         var _loc1_:SharedObject = null;
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         var _loc6_:* = undefined;
         var _loc7_:* = undefined;
         var _loc8_:* = undefined;
         var _loc9_:* = undefined;
         if(justLoadedData)
         {
            trace("just loaded");
            justLoadedData = false;
            return;
         }
         trace("save");
         _loc1_ = SharedObject.getLocal("strawhatsamurai_1_4");
         _loc1_.data.saved = true;
         _loc1_.data.arrowAmmo = arrowAmmo;
         _loc1_.data.hp = hp;
         _loc1_.data.hasBow = hasBow;
         _loc1_.data.gateState = gateState;
         _loc1_.data.tentSquash = tentSquash;
         _loc1_.data.armor = armor;
         _loc1_.data.battlesFought = battlesFought;
         _loc1_.data.totalTiming = totalTiming;
         _loc1_.data.totalKills = totalKills;
         _loc1_.data.totalDeaths = totalDeaths;
         _loc1_.data.totalScore = totalScore;
         _loc1_.data.totalSlashCount = totalSlashCount;
         _loc1_.data.maxCombo = maxCombo;
         _loc1_.data.totalHeadshotCount = totalHeadshotCount;
         _loc1_.data.totalArrowCount = totalArrowCount;
         _loc1_.data.totalArrowHeadShots = totalArrowHeadShots;
         _loc1_.data.totalItems = totalItems;
         _loc1_.data.totalBanners = totalBanners;
         _loc1_.data.turn = turn;
         _loc1_.data.bossDefeated = bossDefeated;
         _loc1_.data.usedCheat = usedCheat;
         _loc1_.data.location = location;
         _loc1_.data.mission = mission;
         _loc1_.data.showAll = showAll;
         _loc1_.data.banner1taken = banner1taken;
         _loc1_.data.banner2taken = banner2taken;
         _loc1_.data.banner3taken = banner3taken;
         _loc1_.data.banner4taken = banner4taken;
         _loc1_.data.banner5taken = banner5taken;
         _loc1_.data.hexitemtaken = hexitemtaken;
         _loc1_.data.patrolsDead = patrolsDead;
         _loc1_.data.patrolsLoc = patrolsLoc;
         _loc1_.data.patrolsDown = patrolsDown;
         _loc2_ = new Array();
         _loc3_ = 0;
         while(_loc3_ <= totalLevels)
         {
            _loc2_.push(levels[_loc3_].visited);
            _loc3_++;
         }
         _loc1_.data.levelsVisited = _loc2_;
         _loc4_ = new Array();
         _loc3_ = 0;
         while(_loc3_ <= totalLevels)
         {
            _loc4_.push(levels[_loc3_].hasItem);
            _loc3_++;
         }
         _loc1_.data.levelsHasItem = _loc4_;
         if(mission == 4)
         {
            _loc5_ = new Array();
            _loc6_ = 0;
            while(_loc6_ <= 10)
            {
               _loc8_ = 0;
               while(_loc8_ <= 11)
               {
                  _loc9_ = getHexSerial(_loc6_,_loc8_);
                  _loc5_[_loc9_] = hexState[_loc6_][_loc8_].side;
                  _loc8_++;
               }
               _loc6_++;
            }
            _loc1_.data.hexSide = _loc5_;
            _loc7_ = new Array();
            _loc6_ = 0;
            while(_loc6_ <= 10)
            {
               _loc8_ = 0;
               while(_loc8_ <= 11)
               {
                  _loc9_ = getHexSerial(_loc6_,_loc8_);
                  _loc7_[_loc9_] = hexState[_loc6_][_loc8_].strength;
                  _loc8_++;
               }
               _loc6_++;
            }
            _loc1_.data.hexStrength = _loc7_;
            _loc1_.data.heroLocationRow = HexManager.heroLocation.row;
            _loc1_.data.heroLocationColumn = HexManager.heroLocation.column;
         }
         _loc1_.flush();
      }
      
      public function addArrowAmmo() : *
      {
         ++arrowAmmo;
         if(arrowAmmo > 10)
         {
            arrowAmmo = 10;
         }
      }
      
      public function displayPatrol() : *
      {
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         if(!showAll)
         {
            map.patrol1.visible = false;
            map.patrol2.visible = false;
            map.patrol3.visible = false;
            map.patrol4.visible = false;
            map.patrol5.visible = false;
            map.patrol6.visible = false;
            map.patrol7.visible = false;
            map.patrol8.visible = false;
            map.patrol9.visible = false;
            map.patrol10.visible = false;
            map.patrol11.visible = false;
            map.patrol12.visible = false;
            map.patrol13.visible = false;
         }
         else
         {
            _loc1_ = 1;
            while(_loc1_ <= 13)
            {
               if(patrolsDead[_loc1_])
               {
                  map.getChildByName("patrol" + _loc1_).visible = false;
               }
               _loc1_++;
            }
            _loc1_ = 1;
            while(_loc1_ <= 13)
            {
               _loc2_ = map.getChildByName("patrol" + _loc1_);
               _loc2_.x = MovieClip(map.getChildByName("circle" + patrolsLoc[_loc1_])).x;
               _loc2_.y = MovieClip(map.getChildByName("circle" + patrolsLoc[_loc1_])).y;
               if(_loc1_ >= 3 && _loc1_ <= 6)
               {
                  if(patrolsLoc[_loc1_] < 18)
                  {
                     _loc2_.scaleX = -1;
                  }
                  else
                  {
                     _loc2_.scaleX = 1;
                  }
               }
               _loc1_++;
            }
         }
      }
      
      public function loadData() : *
      {
         var _loc1_:SharedObject = null;
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         var _loc6_:* = undefined;
         var _loc7_:* = undefined;
         var _loc8_:* = undefined;
         var _loc9_:* = undefined;
         var _loc10_:* = undefined;
         var _loc11_:* = undefined;
         justLoadedData = true;
         _loc1_ = SharedObject.getLocal("strawhatsamurai_1_4");
         arrowAmmo = _loc1_.data.arrowAmmo;
         hp = _loc1_.data.hp;
         hasBow = _loc1_.data.hasBow;
         gateState = _loc1_.data.gateState;
         tentSquash = _loc1_.data.tentSquash;
         armor = _loc1_.data.armor;
         battlesFought = _loc1_.data.battlesFought;
         totalTiming = _loc1_.data.totalTiming;
         totalKills = _loc1_.data.totalKills;
         totalDeaths = _loc1_.data.totalDeaths;
         totalScore = _loc1_.data.totalScore;
         totalSlashCount = _loc1_.data.totalSlashCount;
         maxCombo = _loc1_.data.maxCombo;
         totalHeadshotCount = _loc1_.data.totalHeadshotCount;
         totalArrowCount = _loc1_.data.totalArrowCount;
         totalArrowHeadShots = _loc1_.data.totalArrowHeadShots;
         totalItems = _loc1_.data.totalItems;
         totalBanners = _loc1_.data.totalBanners;
         turn = _loc1_.data.turn;
         afterBoss = _loc1_.data.bossDefeated;
         usedCheat = _loc1_.data.usedCheat;
         location = _loc1_.data.location;
         mission = _loc1_.data.mission;
         showAll = _loc1_.data.showAll;
         banner1taken = _loc1_.data.banner1taken;
         banner2taken = _loc1_.data.banner2taken;
         banner3taken = _loc1_.data.banner3taken;
         banner4taken = _loc1_.data.banner4taken;
         banner5taken = _loc1_.data.banner5taken;
         hexitemtaken = _loc1_.data.hexitemtaken;
         patrolsDead = _loc1_.data.patrolsDead;
         patrolsLoc = _loc1_.data.patrolsLoc;
         patrolsDown = _loc1_.data.patrolsDown;
         _loc2_ = _loc1_.data.levelsVisited;
         _loc3_ = 0;
         while(_loc3_ <= totalLevels)
         {
            levels[_loc3_].visited = _loc2_[_loc3_];
            _loc3_++;
         }
         _loc4_ = _loc1_.data.levelsHasItem;
         _loc3_ = 0;
         while(_loc3_ <= totalLevels)
         {
            levels[_loc3_].hasItem = _loc4_[_loc3_];
            _loc3_++;
         }
         if(mission == 4)
         {
            _loc5_ = _loc1_.data.hexSide;
            _loc6_ = 0;
            while(_loc6_ < 11 * 12)
            {
               _loc10_ = getRowFromSerial(_loc6_);
               _loc11_ = getColFromSerial(_loc6_);
               hexState[_loc10_][_loc11_].side = _loc5_[_loc6_];
               _loc6_++;
            }
            _loc7_ = _loc1_.data.hexStrength;
            _loc6_ = 0;
            while(_loc6_ < 11 * 12)
            {
               _loc10_ = getRowFromSerial(_loc6_);
               _loc11_ = getColFromSerial(_loc6_);
               hexState[_loc10_][_loc11_].strength = _loc7_[_loc6_];
               _loc6_++;
            }
            hexState[10][4].hasPlayer = false;
            _loc8_ = _loc1_.data.heroLocationRow;
            _loc9_ = _loc1_.data.heroLocationColumn;
            hexState[_loc8_][_loc9_].hasPlayer = true;
            HexManager.heroLocation = hexState[_loc8_][_loc9_];
            mission4init = true;
         }
      }
      
      public function gotBanner() : *
      {
         Player.instance.displayScoreMessage("Banner Converted: +2000");
         addScore(2000);
         ++banners;
         if(location == 13)
         {
            banner1taken = true;
         }
         if(getBuildersLeft() == 0)
         {
            banner2taken = true;
         }
      }
      
      public function gotoLevel(param1:int) : *
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         if(mission <= 1 && (param1 == 4 || param1 == 12))
         {
            map.guardtower.gotoAndStop(2);
            showPlayerDialog(LangManager.getWords(10));
            map.objective0.visible = false;
            map.objective1.visible = true;
            mission = 1;
            return;
         }
         if(param1 < location)
         {
            _loc2_ = param1;
            _loc3_ = location;
         }
         else
         {
            _loc2_ = location;
            _loc3_ = param1;
         }
         if(_loc2_ != _loc3_ && map.getChildByName("link_" + _loc2_ + "_" + _loc3_) == null)
         {
            return;
         }
         if(_loc2_ != _loc3_ && !map.getChildByName("link_" + _loc2_ + "_" + _loc3_).visible)
         {
            return;
         }
         previousLocation = location;
         previousHp = hp;
         location = param1;
         nextTurn();
         movePlayerIcon();
         if(!levels[param1].visited || checkPlayerMeetPatrols())
         {
            levels[param1].visited = true;
            if(playEnemyDialog())
            {
               return;
            }
            if(!skipFights)
            {
               map.transition.gotoAndPlay(25);
            }
            else
            {
               displayCircles();
               trace("fight" + location);
            }
         }
         else
         {
            displayCircles();
         }
      }
      
      public function died() : *
      {
         hp = previousHp;
         if(mission != 4 || HexManager.heroLocation == null)
         {
            if(engagedPatrol == -1)
            {
               levels[location].visited = false;
            }
            else
            {
               patrolsDead[engagedPatrol] = false;
            }
            location = previousLocation;
            if(hp < 15)
            {
               hp = 15;
            }
         }
         else
         {
            if(hp < 15)
            {
               hp = 15;
            }
            HexManager.died();
         }
         totalScore -= 10000;
         if(totalScore < 0)
         {
            totalScore = 0;
         }
         arrowAmmo = 5;
         ++totalDeaths;
         banners = 0;
      }
      
      public function countFriendlyHex() : int
      {
         var _loc1_:int = 0;
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:Hex = null;
         _loc1_ = 0;
         _loc2_ = 0;
         while(_loc2_ <= 10)
         {
            _loc3_ = 0;
            while(_loc3_ <= 11)
            {
               _loc4_ = map.hexgrid.getChildByName("hex_" + _loc2_ + "_" + _loc3_);
               if(_loc4_ != null)
               {
                  if(_loc4_.getHexInfo().side == 2)
                  {
                     _loc1_++;
                  }
               }
               _loc3_++;
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function displayArrowAmmo() : *
      {
         MovieClip(Player.instance.parent.parent).arrowammoicon.arrowtext.text = arrowAmmo;
      }
      
      public function getBuildersLeft() : int
      {
         var _loc1_:* = undefined;
         _loc1_ = 0;
         if(!patrolsDead[11])
         {
            _loc1_++;
         }
         if(!patrolsDead[12])
         {
            _loc1_++;
         }
         if(!patrolsDead[13])
         {
            _loc1_++;
         }
         return _loc1_;
      }
      
      public function stageReset() : *
      {
         timing = 0;
         slashCount = 0;
         headshotCount = 0;
         arrowCount = 0;
         banners = 0;
         kills = 0;
         arrowHeadShots = 0;
         Player.instance.gotoAndStop(1);
         Player.instance.player.gotoAndStop(1);
      }
      
      public function displayHex() : *
      {
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         var _loc3_:Hex = null;
         addArrowAmmo();
         addArrowAmmo();
         map.hexgrid.visible = true;
         _loc1_ = 0;
         while(_loc1_ <= totalLevels)
         {
            MovieClip(map.getChildByName("circle" + _loc1_)).visible = false;
            _loc2_ = 0;
            while(_loc2_ <= totalLevels)
            {
               if(map.getChildByName("link_" + _loc1_ + "_" + _loc2_) != null)
               {
                  map.getChildByName("link_" + _loc1_ + "_" + _loc2_).visible = false;
               }
               _loc2_++;
            }
            _loc1_++;
         }
         map.gui.endturnbutton.visible = HexManager.isPlayerTurn;
         if(!HexManager.isPlayerTurn)
         {
            StatsManager.instance.map.gui.words.text = LangManager.getWords(24);
         }
         map.linkout1.visible = false;
         map.linkout2.visible = false;
         map.linkout3.visible = false;
         map.friendly1.visible = false;
         map.friendly2.visible = false;
         map.friendly3.visible = false;
         map.patrol1.visible = false;
         map.patrol2.visible = false;
         map.patrol3.visible = false;
         map.patrol4.visible = false;
         map.patrol5.visible = false;
         map.patrol6.visible = false;
         map.patrol7.visible = false;
         map.patrol8.visible = false;
         map.patrol9.visible = false;
         map.patrol10.visible = false;
         map.patrol11.visible = false;
         map.patrol12.visible = false;
         map.patrol13.visible = false;
         map.gui.itemfounddialog.visible = false;
         map.gui.bowfounddialog.visible = false;
         map.gui.catapultdialog.visible = false;
         map.gui.hexdialog.visible = false;
         map.gui.stats.visible = false;
         map.objective0.visible = false;
         map.objective1.visible = false;
         map.objective2.visible = false;
         map.objective3.visible = false;
         map.objective4.visible = false;
         map.objective5.visible = true;
         playerIcon.visible = false;
         map.friendly1.visible = true;
         map.friendly1.x = map.circle18.x;
         map.friendly1.y = map.circle18.y;
         map.friendly1.scaleX = -1;
         map.friendly2.visible = true;
         map.friendly2.x = map.circle19.x;
         map.friendly2.y = map.circle19.y;
         map.friendly3.visible = true;
         map.friendly3.x = map.circle20.x;
         map.friendly3.y = map.circle20.y;
         map.friendly3.scaleX = -1;
         if(tentSquash)
         {
            map.tentsquash.gotoAndStop(2);
         }
         map.newbanner.visible = banner1taken;
         map.newbanner2.visible = banner2taken;
         map.newbanner3.visible = banner3taken;
         map.newbanner4.visible = banner4taken;
         map.newbanner5.visible = banner5taken;
         map.newbanner6.visible = bossDefeated;
         map.hexitem.visible = !hexitemtaken;
         map.gate.gotoAndStop(gateState);
         if(gateState >= 15)
         {
            map.hexgrid.removeChild(map.hexgrid.hex_10_5);
         }
         if(gateState >= 10)
         {
            map.hexgrid.removeChild(map.hexgrid.hex_10_6);
         }
         if(gateState >= 5)
         {
            map.hexgrid.removeChild(map.hexgrid.hex_10_7);
         }
         if(!mission4init)
         {
            initMission4();
         }
         _loc1_ = 0;
         while(_loc1_ <= 10)
         {
            _loc2_ = 0;
            while(_loc2_ <= 11)
            {
               _loc3_ = map.hexgrid.getChildByName("hex_" + _loc1_ + "_" + _loc2_);
               if(_loc3_ != null)
               {
                  _loc3_.init(hexState[_loc1_][_loc2_]);
                  _loc3_.updateDisplay();
               }
               _loc2_++;
            }
            _loc1_++;
         }
         if(bossDefeated)
         {
            map.objective5.visible = false;
            displayStats();
            map.gui.missionaccomplished.gotoAndPlay(2);
            map.gui.words.text = "";
         }
      }
      
      public function setPlayerIcon(param1:MovieClip) : *
      {
         this.playerIcon = param1;
      }
      
      public function stageEnd() : *
      {
         var _loc1_:* = undefined;
         updateStats();
         saveData();
         if(hasBow)
         {
            addArrowAmmo();
            addArrowAmmo();
         }
         map.gui.itemfounddialog.visible = false;
         map.gui.bowfounddialog.visible = false;
         map.gui.catapultdialog.visible = false;
         map.gui.hexdialog.visible = false;
         map.gui.stats.visible = false;
         switch(location)
         {
            case 36:
               if(turn == 1)
               {
                  map.gui.mission.gotoAndPlay(2);
                  map.gui.introanim.visible = true;
                  showPlayerDialog(LangManager.getWords(19));
               }
               break;
            case 0:
               if(turn == 2)
               {
                  showPlayerDialog(LangManager.getWords(20));
               }
               break;
            case 1:
               if(levels[1].hasItem)
               {
                  getItem();
                  levels[1].hasItem = false;
               }
               break;
            case 5:
               if(!hasBow)
               {
                  hasBow = true;
                  map.gui.bowfounddialog.visible = true;
               }
               break;
            case 6:
               if(levels[6].hasItem)
               {
                  getItem();
                  levels[6].hasItem = false;
               }
               break;
            case 8:
               if(levels[8].hasItem)
               {
                  getItem();
                  levels[8].hasItem = false;
               }
               break;
            case 9:
               if(levels[9].hasItem)
               {
                  getItem();
                  levels[9].hasItem = false;
               }
               break;
            case 13:
               mission = 2;
               showAll = true;
               if(getBuildersLeft() > 0)
               {
                  showPlayerDialog(LangManager.getWords(21));
               }
               levels[4].visited = true;
               levels[7].visited = true;
               _loc1_ = 12;
               while(_loc1_ <= 27)
               {
                  levels[_loc1_].visited = true;
                  _loc1_++;
               }
               break;
            case 21:
               if(levels[21].hasItem)
               {
                  getItem();
                  levels[21].hasItem = false;
               }
               break;
            case 27:
               if(levels[27].hasItem)
               {
                  getItem();
                  levels[27].hasItem = false;
               }
               break;
            case 37:
               location = 5;
               break;
            case 22:
            case 23:
            case 24:
               if(getBuildersLeft() == 0 && mission == 2)
               {
                  mission = 3;
                  map.gui.catapultdialog.visible = true;
                  if(turn < 24)
                  {
                     showPlayerDialog(LangManager.getWords(22) + (24 - turn) + LangManager.getWords(23));
                     turn = 24;
                  }
                  if(gateState >= 25)
                  {
                     map.gui.catapultdialog.btn2.visible = false;
                  }
               }
         }
         if(turn >= 30 && gateState < 25 && mission == 3)
         {
            saveData();
            mission = 4;
         }
      }
   }
}


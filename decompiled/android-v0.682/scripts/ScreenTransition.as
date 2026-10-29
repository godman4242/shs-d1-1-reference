package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2758")]
   public class ScreenTransition extends MovieClip
   {
      
      internal static var TRANSITION_BLACKCLOSE:int = 0;
      
      internal static var TRANSITION_BLACKOPEN:int = 1;
      
      internal static var TRANSITION_WHITEIN:int = 2;
      
      internal static var TRANSITION_WAIT:int = 3;
      
      internal static var ACTION_NOTHING:int = 0;
      
      internal static var ACTION_EXPLORENODE:int = 1;
      
      internal static var ACTION_INTERACT:int = 2;
      
      internal static var ACTION_REFRESHROOM:int = 3;
      
      internal static var ACTION_REST:int = 4;
      
      internal static var ACTION_TELEPORT:int = 5;
      
      internal static var ACTION_TELEPORTDOWNED:int = 6;
      
      internal static var ACTION_TELEPORTCLANQUEST:int = 7;
      
      internal static var ACTION_NOTHINGCLOSE:int = 8;
      
      internal static var ACTION_REFRESHROOMONOPEN:int = 9;
      
      public var blackup:MovieClip;
      
      public var white:MovieClip;
      
      public var blackdown:MovieClip;
      
      internal var action:int = 0;
      
      internal var param:Object;
      
      internal var transitioning:Boolean = false;
      
      internal var blackMovtSpeed:Number;
      
      internal var transitionType:int;
      
      internal var counter:int;
      
      internal var teleportTarget:int;
      
      internal var teleportRoom:int;
      
      internal var teleportXPos:int = 150;
      
      internal var waitingForTerritoryData:Boolean = false;
      
      public function ScreenTransition()
      {
         super();
         this.blackup.visible = false;
         this.blackdown.visible = false;
         this.white.visible = false;
      }
      
      public function update() : *
      {
         if(!this.transitioning)
         {
            return;
         }
         ++this.counter;
         if(this.transitionType == TRANSITION_BLACKCLOSE)
         {
            this.blackup.y += this.blackMovtSpeed;
            this.blackdown.y -= this.blackMovtSpeed;
            this.blackMovtSpeed += 2;
            if(this.blackup.y >= 0)
            {
               this.blackup.y = 0;
               this.blackdown.y = 240;
               if(this.counter >= 17)
               {
                  this.doAction();
               }
            }
         }
         else if(this.transitionType == TRANSITION_BLACKOPEN)
         {
            this.blackup.y -= this.blackMovtSpeed;
            this.blackdown.y += this.blackMovtSpeed;
            this.blackMovtSpeed += 2;
            if(this.blackup.y <= -240)
            {
               this.blackup.y = -240;
               this.blackdown.y = 480;
               this.blackup.visible = false;
               this.blackdown.visible = false;
               this.blackup.cacheAsBitmap = false;
               this.blackdown.cacheAsBitmap = false;
               this.doAction();
            }
         }
         else if(this.transitionType == TRANSITION_WHITEIN)
         {
            this.white.alpha -= 1 / 24;
            if(this.white.alpha <= 0)
            {
               this.white.visible = false;
               this.white.cacheAsBitmap = false;
               this.transitioning = false;
            }
            if(this.counter == 2)
            {
               this.doAction();
            }
         }
      }
      
      public function startClose(afterActionNum:int) : *
      {
         if(this.transitioning && afterActionNum == 3)
         {
            return;
         }
         this.action = afterActionNum;
         this.transitioning = true;
         if(OverworldHUD.instance != null)
         {
            OverworldHUD.instance.closeOpenDialogs();
         }
         this.transitionType = TRANSITION_BLACKCLOSE;
         this.blackup.visible = true;
         this.blackdown.visible = true;
         this.blackup.cacheAsBitmap = true;
         this.blackdown.cacheAsBitmap = true;
         this.white.visible = false;
         this.blackup.y = -240;
         this.blackdown.y = 480;
         this.blackMovtSpeed = 0;
         this.counter = 0;
      }
      
      public function startOpen(afterActionNum:int) : *
      {
         this.action = afterActionNum;
         this.transitioning = true;
         this.transitionType = TRANSITION_BLACKOPEN;
         this.blackup.visible = true;
         this.blackdown.visible = true;
         this.blackup.cacheAsBitmap = true;
         this.blackdown.cacheAsBitmap = true;
         this.white.visible = false;
         this.blackup.y = 0;
         this.blackdown.y = 240;
         this.blackMovtSpeed = 0;
         this.counter = 0;
      }
      
      public function startOpenWhite(afterActionNum:int) : *
      {
         this.action = afterActionNum;
         this.transitioning = true;
         this.transitionType = TRANSITION_WHITEIN;
         this.blackup.visible = false;
         this.blackdown.visible = false;
         this.white.visible = true;
         this.white.alpha = 1;
         this.counter = 0;
         if(!this.white.cacheAsBitmap)
         {
            this.white.cacheAsBitmapMatrix = this.white.transform.concatenatedMatrix;
            this.white.cacheAsBitmap = true;
         }
      }
      
      public function setParam(object:Object) : *
      {
         this.param = object;
      }
      
      public function setTeleportTarget(nodeid:int, roomid:int = 0, xpos:int = 150) : *
      {
         this.teleportTarget = nodeid;
         this.teleportRoom = roomid;
         if(this.teleportRoom == -1)
         {
            this.teleportRoom = 0;
         }
         this.teleportXPos = xpos;
      }
      
      public function isTransitioning() : Boolean
      {
         return this.transitioning;
      }
      
      public function isWaitingForTerritoryData() : Boolean
      {
         return this.waitingForTerritoryData;
      }
      
      public function gotTerritoryData() : *
      {
         GameEngine.hideLoadingScreen();
         this.waitingForTerritoryData = false;
         this.doAction();
      }
      
      public function doAction() : *
      {
         var interactiveStageObject:InteractiveStageObject = null;
         this.transitioning = false;
         switch(this.action)
         {
            case ACTION_NOTHING:
               break;
            case ACTION_NOTHINGCLOSE:
               this.startOpen(ACTION_NOTHING);
               break;
            case ACTION_EXPLORENODE:
               Overworld.exploreNode();
               this.startOpen(ACTION_NOTHING);
               break;
            case ACTION_INTERACT:
               interactiveStageObject = this.param as InteractiveStageObject;
               interactiveStageObject.interact();
               this.startOpen(ACTION_NOTHING);
               break;
            case ACTION_TELEPORT:
               if(!this.waitingForTerritoryData && StageManager.changedTerritoryButNoData(this.teleportTarget))
               {
                  this.waitingForTerritoryData = true;
                  GameEngine.showLoadingScreen();
                  this.transitioning = true;
                  this.transitionType = TRANSITION_WAIT;
                  return;
               }
               if(this.teleportTarget != -1)
               {
                  StageManager.gotoRoom(this.teleportRoom,this.teleportXPos,this.teleportTarget);
               }
               this.teleportTarget = -1;
               this.teleportXPos = 150;
               this.teleportRoom = 0;
               this.startOpen(ACTION_NOTHING);
               break;
            case ACTION_TELEPORTDOWNED:
               if(this.teleportTarget != -1)
               {
                  StageManager.gotoRoom(this.teleportRoom,this.teleportXPos,this.teleportTarget);
               }
               this.teleportTarget = -1;
               this.teleportXPos = 150;
               this.teleportRoom = 0;
               this.startOpen(ACTION_NOTHING);
               StatsManager.getPlayer().startAction(MCSActor.DOWNED_STATE);
               StatsManager.getPlayer().getMCS().showDisplayName(false);
               break;
            case ACTION_TELEPORTCLANQUEST:
               if(!this.waitingForTerritoryData && StageManager.changedTerritoryButNoData(this.teleportTarget))
               {
                  this.waitingForTerritoryData = true;
                  GameEngine.showLoadingScreen();
                  this.transitioning = true;
                  this.transitionType = TRANSITION_WAIT;
                  return;
               }
               if(this.teleportTarget != -1)
               {
                  StageManager.gotoRoom(this.teleportRoom,this.teleportXPos,this.teleportTarget);
               }
               this.teleportTarget = -1;
               this.teleportXPos = 150;
               this.teleportRoom = 0;
               this.startOpen(ACTION_NOTHING);
               StatsManager.saveLocation(StatsManager.getStat(30021));
               QueryManager.instance.saveModifiedCharData();
               break;
            case ACTION_REFRESHROOM:
               StageManager.refreshRoomQuestObjects();
               this.startOpen(ACTION_NOTHING);
               break;
            case ACTION_REFRESHROOMONOPEN:
               StageManager.refreshRoomQuestObjects();
               this.transitioning = true;
               break;
            case ACTION_REST:
               if(StatsManager.getPlayerStats(StatsManager.STAT_AP) < StatsManager.getPlayerStats(StatsManager.STAT_MAXAP) / 3)
               {
                  StatsManager.setStat(StatsManager.STAT_AP,StatsManager.getPlayerStats(StatsManager.STAT_MAXAP) / 3);
               }
               StatsManager.fullHealth();
               QueryManager.instance.saveModifiedCharData();
               OverworldHUD.instance.showDialog(LangManager.getString(205),LangManager.getString(5));
               this.startOpen(ACTION_NOTHING);
               SoundManager.instance.playGoodKoto();
         }
      }
   }
}


package shunpo_fla
{
   import adobe.utils.*;
   import flash.accessibility.*;
   import flash.display.*;
   import flash.errors.*;
   import flash.events.*;
   import flash.external.*;
   import flash.filters.*;
   import flash.geom.*;
   import flash.media.*;
   import flash.net.*;
   import flash.printing.*;
   import flash.system.*;
   import flash.text.*;
   import flash.ui.*;
   import flash.utils.*;
   import flash.xml.*;
   
   public dynamic class MainTimeline extends MovieClip
   {
      
      public var sharedObject:SharedObject;
      
      public var statsManager:*;
      
      public var overworldMode:Boolean;
      
      public var gameStage:MovieClip;
      
      public var survivalgame:Boolean;
      
      public var hinttext:TextField;
      
      public var hptext:TextField;
      
      public var healthbar:MovieClip;
      
      public var t2:tree2;
      
      public var t3:tree2;
      
      public var t1:tree1;
      
      public var smallsticker:SimpleButton;
      
      public var t4:tree1;
      
      public var loadingtext:TextField;
      
      public var mutebutton:MovieClip;
      
      public var f2:MovieClip;
      
      public var redbg:MovieClip;
      
      public var continuebutton:SimpleButton;
      
      public var password:TextField;
      
      public var cloud2:MovieClip;
      
      public var cloud4:MovieClip;
      
      public var cloud6:MovieClip;
      
      public var f1:MovieClip;
      
      public var cloud3:MovieClip;
      
      public var cloud7:MovieClip;
      
      public var cloud1:MovieClip;
      
      public var cloud5:MovieClip;
      
      public var cloud8:MovieClip;
      
      public var jumptostrat:Boolean;
      
      public var scoretext:TextField;
      
      public var stagebg1:MovieClip;
      
      public var stagebg2:MovieClip;
      
      public var initMode:Boolean;
      
      public var stageManager:*;
      
      public var playericon:*;
      
      public var player:MovieClip;
      
      public var thing:MovieClip;
      
      public var lutbutton:SimpleButton;
      
      public var enemyManager:*;
      
      public var pauseGame:Boolean;
      
      public var slashcanvas:MovieClip;
      
      public var samuraipic:MovieClip;
      
      public var staticbg:MovieClip;
      
      public var scoremessage:TextField;
      
      public var cloudspeed:*;
      
      public var foreground:MovieClip;
      
      public var arrowammoicon:MovieClip;
      
      public var transition:MovieClip;
      
      public var canvas:MovieClip;
      
      public var guicover:MovieClip;
      
      public var map:MovieClip;
      
      public var playbutton:SimpleButton;
      
      public var playercanvas:MovieClip;
      
      public var projectileManager:*;
      
      public var particleSystemManager:*;
      
      public var scoreboard:MovieClip;
      
      public var soundManager:*;
      
      public var tt1:tree1;
      
      public var tt2:tree2;
      
      public var tt3:tree2;
      
      public var tt4:tree1;
      
      public var mousePressed:Boolean;
      
      public var newgamewarning:MovieClip;
      
      public var loadgame:Boolean;
      
      public var e4sticker:SimpleButton;
      
      public var survivalbutton:SimpleButton;
      
      public function MainTimeline()
      {
         super();
         addFrameScript(0,frame1,1,frame2,2,frame3,3,frame4,4,frame5,5,frame6,6,frame7);
      }
      
      public function ptitleClickEvent(param1:Event) : void
      {
         thing.removeEventListener(Event.ENTER_FRAME,titleloop);
         if(password.text.toLowerCase() == "strategy mode")
         {
            jumptostrat = true;
         }
         play();
      }
      
      public function mouseMoveEvent(param1:MouseEvent) : *
      {
         if(initMode)
         {
            return;
         }
         if(overworldMode)
         {
            return;
         }
         player.drawLine(mousePressed,mouseX,mouseY,canvas);
      }
      
      public function onComplete(param1:Event) : void
      {
         nextFrame();
      }
      
      public function mouseUpEvent(param1:MouseEvent) : *
      {
         if(initMode)
         {
            return;
         }
         if(overworldMode)
         {
            return;
         }
         player.mouseUp(mouseX,mouseY,canvas,mousePressed);
         mousePressed = false;
      }
      
      internal function frame2() : *
      {
         stop();
         newgamewarning.visible = false;
         playbutton.addEventListener(MouseEvent.CLICK,ptitleClickEvent);
         playbutton.addEventListener(MouseEvent.MOUSE_OVER,ptitleOverEvent);
         playbutton.addEventListener(MouseEvent.MOUSE_OUT,ptitleOutEvent);
         continuebutton.addEventListener(MouseEvent.CLICK,ctitleClickEvent);
         survivalbutton.addEventListener(MouseEvent.CLICK,stitleClickEvent);
         smallsticker.addEventListener(MouseEvent.CLICK,se4ClickEvent);
         lutbutton.addEventListener(MouseEvent.CLICK,lutClickEvent);
         thing.addEventListener(Event.ENTER_FRAME,titleloop);
         cloudspeed = new Array();
         jumptostrat = false;
         loadgame = false;
         survivalgame = false;
         sharedObject = SharedObject.getLocal("strawhatsamurai_1_4");
         if(sharedObject.data.saved == undefined)
         {
            continuebutton.visible = false;
            password.y = 262;
         }
      }
      
      internal function frame4() : *
      {
         initMode = false;
         overworldMode = false;
         if(map != null)
         {
            stage.removeChild(map);
         }
         mousePressed = false;
         pauseGame = false;
         enemyManager.reinit(gameStage);
         projectileManager.reinit(gameStage);
         particleSystemManager.reinit(gameStage);
         stageManager.reinit(gameStage);
         playercanvas.addChild(player);
         player.reinit();
         redbg.visible = false;
         scoreboard.visible = false;
         continuebutton.visible = false;
         continuebutton.addEventListener(MouseEvent.CLICK,onMouseClickEvent);
         stop();
         stageManager.init();
         StatsManager.instance.addScore(0);
         StatsManager.instance.displayHP();
         transition.transition.gotoAndPlay(2);
         arrowammoicon.visible = false;
         guicover.visible = false;
         ++StatsManager.instance.battlesFought;
         if(StatsManager.instance.location == 13)
         {
            StageManager.instance.showHint("Use your bow to eliminate the archers in the guardtower");
         }
         if(Boolean(SoundManager.instance.isPlaying) && Boolean(SoundManager.instance.playSounds))
         {
            mutebutton.gotoAndStop(2);
         }
         else if(!SoundManager.instance.isPlaying && Boolean(SoundManager.instance.playSounds))
         {
            mutebutton.gotoAndStop(3);
         }
         else if(!SoundManager.instance.isPlaying && !SoundManager.instance.playSounds)
         {
            mutebutton.gotoAndStop(4);
         }
         mutebutton.buttonMode = true;
         mutebutton.addEventListener(MouseEvent.CLICK,muteClickEvent);
      }
      
      internal function frame3() : *
      {
         initMode = true;
         mousePressed = false;
         pauseGame = false;
         overworldMode = false;
         enemyManager = new EnemyManager(gameStage);
         statsManager = new StatsManager();
         soundManager = new SoundManager();
         projectileManager = new ProjectileManager(gameStage);
         particleSystemManager = new ParticleSystemManager(gameStage);
         stageManager = new StageManager(gameStage);
         player = Player.createPlayer(100,350,this);
         redbg.visible = false;
         stage.addEventListener(Event.ENTER_FRAME,gameloop);
         stage.addEventListener(MouseEvent.MOUSE_MOVE,mouseMoveEvent);
         stage.addEventListener(MouseEvent.MOUSE_DOWN,mouseDownEvent);
         stage.addEventListener(MouseEvent.MOUSE_UP,mouseUpEvent);
         stage.addEventListener(KeyboardEvent.KEY_DOWN,reportKeyDown);
         stage.addEventListener(KeyboardEvent.KEY_UP,reportKeyUp);
         if(jumptostrat)
         {
            StatsManager.instance.jumpToStrategyMode();
            goOverworld();
         }
         else if(loadgame)
         {
            StatsManager.instance.loadData();
            goOverworld();
         }
         else if(survivalgame)
         {
            StatsManager.instance.initSurvivalMode();
            goFightstage();
         }
         else
         {
            goFightstage();
         }
      }
      
      internal function frame5() : *
      {
         MochiAd.showInterLevelAd({
            "clip":root,
            "id":"8d49e85f7cb105ed",
            "res":"720x400"
         });
         overworldMode = true;
         stage.showDefaultContextMenu = false;
      }
      
      internal function frame6() : *
      {
         stop();
         initMode = false;
         overworldMode = true;
         map = new overworld();
         stage.addChild(map);
         map.transition.gotoAndPlay(2);
         playericon = new player_icon();
         map.playercanvas.addChild(playericon);
         map.y = -830;
         statsManager.setMap(map);
         statsManager.setRoot(this);
         statsManager.setPlayerIcon(playericon);
         statsManager.displayCircles();
         statsManager.hideMapMsg();
         HexManager.reinit();
      }
      
      internal function frame1() : *
      {
         MochiAd.showPreGameAd({
            "clip":root,
            "id":"8d49e85f7cb105ed",
            "res":"720x400"
         });
      }
      
      public function lutClickEvent(param1:Event) : void
      {
         var url:String = null;
         var request:URLRequest = null;
         var event:Event = param1;
         url = "http://lutc.blogspot.com";
         request = new URLRequest(url);
         try
         {
            navigateToURL(request,"_blank");
         }
         catch(e:Error)
         {
            trace("Error occurred!");
         }
      }
      
      public function reportKeyUp(param1:KeyboardEvent) : void
      {
         if(initMode)
         {
            return;
         }
         if(overworldMode)
         {
            return;
         }
         switch(param1.keyCode)
         {
            case 81:
               if(stage.quality == "HIGH")
               {
                  stage.quality = StageQuality.MEDIUM;
                  ParticleSystemManager.quality = "MEDIUM";
               }
               else if(stage.quality == "MEDIUM")
               {
                  stage.quality = StageQuality.LOW;
                  ParticleSystemManager.quality = "LOW";
               }
               else if(stage.quality == "LOW")
               {
                  stage.quality = StageQuality.HIGH;
                  ParticleSystemManager.quality = "HIGH";
               }
               break;
            case Keyboard.SPACE:
               if(Player.stageMode == 1)
               {
                  return;
               }
               pauseGame = !pauseGame;
               if(pauseGame)
               {
                  enemyManager.pauseGame();
                  Player.instance.displayScoreMessage("Paused");
               }
               else
               {
                  enemyManager.unpauseGame();
                  Player.instance.displayScoreMessage("");
               }
               break;
            case Keyboard.SHIFT:
               if(Player.stageMode == 1 || Player.stageMode == 2)
               {
                  return;
               }
               player.setAimingArrow(false,mouseX,mouseY);
               mousePressed = false;
               arrowammoicon.visible = false;
               break;
            case 65:
            case 37:
               Player.instance.keyScrollLeft = false;
               break;
            case 68:
            case 39:
               Player.instance.keyScrollRight = false;
         }
      }
      
      internal function frame7() : *
      {
         stop();
         e4sticker.addEventListener(MouseEvent.CLICK,e4ClickEvent);
         this.loaderInfo.addEventListener(ProgressEvent.PROGRESS,onProgress);
         this.loaderInfo.addEventListener(Event.COMPLETE,onComplete);
      }
      
      public function onMouseClickEvent(param1:Event) : void
      {
         if(StatsManager.instance.survivalMode)
         {
            SoundManager.instance.stopMusic();
            gotoAndPlay(1,"title");
         }
         else
         {
            StatsManager.instance.died();
            goOverworld();
         }
      }
      
      public function overworldloop() : *
      {
         if(initMode)
         {
            return;
         }
         if(map.gui.introanim.visible)
         {
            return;
         }
         HexManager.update();
         map.uparrow.visible = false;
         map.downarrow.visible = false;
         ++StatsManager.instance.totalTiming;
         if(mouseY < 50 && map.y < -10)
         {
            map.uparrow.visible = true;
            StatsManager.instance.moveMap(10);
         }
         if(mouseY > 350 && map.y > -830)
         {
            map.downarrow.visible = true;
            StatsManager.instance.moveMap(-10);
         }
      }
      
      public function muteClickEvent(param1:Event) : void
      {
         if(mutebutton.currentFrame == 2)
         {
            mutebutton.gotoAndStop(3);
         }
         else if(mutebutton.currentFrame == 3)
         {
            mutebutton.gotoAndStop(4);
         }
         else if(mutebutton.currentFrame == 4)
         {
            mutebutton.gotoAndStop(2);
         }
      }
      
      public function titleloop(param1:Event) : *
      {
         f1.x -= 2;
         f2.x -= 2;
         if(f1.x <= -1300)
         {
            f1.x = 1300;
         }
         if(f2.x <= -1300)
         {
            f2.x = 1300;
         }
         titleClouds();
         t1.x -= 2;
         t2.x -= 2;
         t3.x -= 2;
         t4.x -= 2;
         if(t1.x < -200)
         {
            t1.x = 900 + Math.random() * 400;
         }
         if(t2.x < -200)
         {
            t2.x = 900 + Math.random() * 400;
         }
         if(t3.x < -200)
         {
            t3.x = 900 + Math.random() * 400;
         }
         if(t4.x < -200)
         {
            t4.x = 900 + Math.random() * 400;
         }
         --tt1.x;
         --tt2.x;
         --tt3.x;
         --tt4.x;
         if(tt1.x < -100)
         {
            tt1.x = 800 + Math.random() * 200;
         }
         if(tt2.x < -100)
         {
            tt2.x = 800 + Math.random() * 200;
         }
         if(tt3.x < -100)
         {
            tt3.x = 800 + Math.random() * 200;
         }
         if(tt4.x < -100)
         {
            tt4.x = 800 + Math.random() * 200;
         }
      }
      
      public function ptitleOverEvent(param1:Event) : void
      {
         if(continuebutton.visible)
         {
            newgamewarning.visible = true;
         }
      }
      
      public function onProgress(param1:ProgressEvent) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:int = 0;
         _loc2_ = Number(param1.target.bytesLoaded);
         _loc3_ = Number(param1.target.bytesTotal);
         _loc4_ = _loc2_ / _loc3_;
         loadingtext.text = _loc4_.toString();
      }
      
      public function goOverworld() : *
      {
         overworldMode = true;
         gotoAndStop(1,"overworld");
      }
      
      public function titleClouds() : *
      {
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         if(cloudspeed.length == 0)
         {
            _loc1_ = 1;
            while(_loc1_ <= 8)
            {
               cloudspeed[_loc1_] = Math.random();
               getChildByName("cloud" + _loc1_).y = 50 + Math.random() * 200;
               if(Math.random() * 3 < 1)
               {
                  getChildByName("cloud" + _loc1_).visible = false;
               }
               _loc1_++;
            }
         }
         _loc1_ = 1;
         while(_loc1_ <= 8)
         {
            _loc2_ = getChildByName("cloud" + _loc1_);
            _loc2_.x -= cloudspeed[_loc1_];
            if(_loc2_.x < -100)
            {
               _loc2_.x = 820;
               _loc2_.y = 50 + Math.random() * 200;
               cloudspeed[_loc1_] = Math.random();
               if(Math.random() * 3 < 1)
               {
                  _loc2_.visible = false;
               }
            }
            _loc1_++;
         }
      }
      
      public function stitleClickEvent(param1:Event) : void
      {
         thing.removeEventListener(Event.ENTER_FRAME,titleloop);
         survivalgame = true;
         play();
      }
      
      public function gameloop(param1:Event) : void
      {
         if(initMode)
         {
            return;
         }
         if(overworldMode)
         {
            overworldloop();
         }
         else
         {
            player.update(mousePressed,mouseX,mouseY);
            if(!pauseGame)
            {
               enemyManager.update();
               projectileManager.update();
               particleSystemManager.update();
               stageManager.update();
            }
         }
      }
      
      public function ctitleClickEvent(param1:Event) : void
      {
         thing.removeEventListener(Event.ENTER_FRAME,titleloop);
         if(password.text.toLowerCase() == "strategy mode")
         {
            jumptostrat = true;
         }
         loadgame = true;
         play();
      }
      
      public function se4ClickEvent(param1:Event) : void
      {
         var url:String = null;
         var request:URLRequest = null;
         var event:Event = param1;
         url = "http://www.goldenjoystick.com/";
         request = new URLRequest(url);
         try
         {
            navigateToURL(request,"_blank");
         }
         catch(e:Error)
         {
            trace("Error occurred!");
         }
      }
      
      public function e4ClickEvent(param1:Event) : void
      {
         var url:String = null;
         var request:URLRequest = null;
         var event:Event = param1;
         url = "http://www.e4.com/joystick/";
         request = new URLRequest(url);
         try
         {
            navigateToURL(request,"_blank");
         }
         catch(e:Error)
         {
            trace("Error occurred!");
         }
      }
      
      public function reportKeyDown(param1:KeyboardEvent) : void
      {
         if(initMode)
         {
            return;
         }
         if(overworldMode)
         {
            return;
         }
         switch(param1.keyCode)
         {
            case Keyboard.SHIFT:
               if(StatsManager.instance.hasBow)
               {
                  arrowammoicon.visible = true;
               }
               StatsManager.instance.displayArrowAmmo();
               if(!StatsManager.instance.hasBow || StatsManager.instance.arrowAmmo <= 0 || Player.stageMode == 1 || Player.stageMode == 2)
               {
                  return;
               }
               player.setAimingArrow(true,mouseX,mouseY);
               break;
            case 65:
            case 37:
               Player.instance.keyScrollLeft = true;
               break;
            case 68:
            case 39:
               Player.instance.keyScrollRight = true;
         }
      }
      
      public function mouseDownEvent(param1:MouseEvent) : *
      {
         if(initMode)
         {
            return;
         }
         if(overworldMode)
         {
            return;
         }
         mousePressed = true;
         player.mouseDown(mouseX,mouseY,canvas);
      }
      
      public function ptitleOutEvent(param1:Event) : void
      {
         if(newgamewarning != null)
         {
            newgamewarning.visible = false;
         }
      }
      
      public function goFightstage() : *
      {
         overworldMode = false;
         gotoAndStop(1,"fightstage");
      }
   }
}


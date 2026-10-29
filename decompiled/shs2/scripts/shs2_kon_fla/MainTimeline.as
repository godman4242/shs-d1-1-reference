package shs2_kon_fla
{
   import adobe.utils.*;
   import com.omniture.ActionSource;
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
   import mochi.*;
   
   public dynamic class MainTimeline extends MovieClip
   {
      
      public var timeTaken:TextField;
      
      public var tracetext:TextField;
      
      public var hitcombocount:MovieClip;
      
      public var fence1:MovieClip;
      
      public var fence2:MovieClip;
      
      public var fence3:MovieClip;
      
      public var fence4:MovieClip;
      
      public var fence5:MovieClip;
      
      public var fence6:MovieClip;
      
      public var shs1button:SimpleButton;
      
      public var grass1_1:MovieClip;
      
      public var grass1_2:MovieClip;
      
      public var fgtree1:MovieClip;
      
      public var fgtree2:MovieClip;
      
      public var introMode:Boolean;
      
      public var bg:MovieClip;
      
      public var diedDialog:MovieClip;
      
      public var tree2:MovieClip;
      
      public var tree4:MovieClip;
      
      public var tree1:MovieClip;
      
      public var tree3:MovieClip;
      
      public var missionstart:MovieClip;
      
      public var e4button:SimpleButton;
      
      public var fgleaf3:MovieClip;
      
      public var logs2:MovieClip;
      
      public var loader1:MovieClip;
      
      public var deaths:TextField;
      
      public var logs1:MovieClip;
      
      public var fgleaf1:MovieClip;
      
      public var fgleaf2:MovieClip;
      
      public var redbg:MovieClip;
      
      public var score:MovieClip;
      
      public var mutebutton:MovieClip;
      
      public var mainmenu:MovieClip;
      
      public var enemyLayer:MovieClip;
      
      public var boss4:Boss4;
      
      public var maxCombo:TextField;
      
      public var enemyLayer2:MovieClip;
      
      public var hurtcolor:MovieClip;
      
      public var bgtree10:MovieClip;
      
      public var s:ActionSource;
      
      public var initMode:Boolean;
      
      public var kills:TextField;
      
      public var backbutton:SimpleButton;
      
      public var rocketLayer:MovieClip;
      
      public var headshots:TextField;
      
      public var player:MovieClip;
      
      public var slashes:TextField;
      
      public var lutbutton:SimpleButton;
      
      public var landend:MovieClip;
      
      public var mm_credits:MovieClip;
      
      public var slashcanvas:MovieClip;
      
      public var ledge2:MovieClip;
      
      public var ledge3:MovieClip;
      
      public var banner:MovieClip;
      
      public var ledge6:MovieClip;
      
      public var bgtree1:MovieClip;
      
      public var ledge8:MovieClip;
      
      public var ledge9:MovieClip;
      
      public var bossoverheat:MovieClip;
      
      public var ledge4:MovieClip;
      
      public var ledge5:MovieClip;
      
      public var bgtree8:MovieClip;
      
      public var bgtree9:MovieClip;
      
      public var bgtree4:MovieClip;
      
      public var bgtree7:MovieClip;
      
      public var bosshp:MovieClip;
      
      public var ledge7:MovieClip;
      
      public var bgtree2:MovieClip;
      
      public var mountain1:MovieClip;
      
      public var mountain2:MovieClip;
      
      public var bgtree3:MovieClip;
      
      public var mountain3:MovieClip;
      
      public var transition:MovieClip;
      
      public var _mochiads_game_id:String;
      
      public var canvas:MovieClip;
      
      public var mm_stageselect:MovieClip;
      
      public var submitbutton:SimpleButton;
      
      public var walls2:MovieClip;
      
      public var max:int;
      
      public var tutorial:MovieClip;
      
      public var ledge1:MovieClip;
      
      public var grass4_1:MovieClip;
      
      public var skipbutton:SimpleButton;
      
      public var hitsTaken:TextField;
      
      public var grass4_2:MovieClip;
      
      public var rock:MovieClip;
      
      public var ground:MovieClip;
      
      public var walls1:MovieClip;
      
      public var playerhp:MovieClip;
      
      public var grass3_1:MovieClip;
      
      public var grass3_2:MovieClip;
      
      public var mountainshade:MovieClip;
      
      public var exitledge3:MovieClip;
      
      public var exitledge1:MovieClip;
      
      public var totalscore:TextField;
      
      public var pausemsg:MovieClip;
      
      public var leaflayer1:MovieClip;
      
      public var leaflayer2:MovieClip;
      
      public var enemiesLaunched:TextField;
      
      public var exitledge2:MovieClip;
      
      public var grass2_1:MovieClip;
      
      public var grass2_2:MovieClip;
      
      public var enemiesStabbed:TextField;
      
      public function MainTimeline()
      {
         super();
         addFrameScript(0,frame1,1,frame2,3,frame4,78,frame79,129,frame130,130,frame131,131,frame132,132,frame133,228,frame229,229,frame230,325,frame326,326,frame327,422,frame423,423,frame424,471,frame472,472,frame473,473,frame474,520,frame521,592,frame593,605,frame606,606,frame607);
      }
      
      public function mouseMoveEvent(param1:MouseEvent) : *
      {
         if(initMode)
         {
            return;
         }
         InputManager.instance.drawLine(mouseX,mouseY,canvas);
      }
      
      internal function frame607() : *
      {
         if(GameStage.currentStage == 1)
         {
            gotoAndStop(1,"forest");
         }
         else if(GameStage.currentStage == 2)
         {
            gotoAndStop(1,"mountain");
         }
         else if(GameStage.currentStage == 3)
         {
            gotoAndStop(1,"battlefield");
         }
         else if(GameStage.currentStage == 4)
         {
            gotoAndStop(1,"fortwalls");
         }
      }
      
      internal function frame606() : *
      {
         s.linkTrackVars = "eVar32,products,events";
         s.linkTrackEvents = "event21,event22,event23";
         s.eVar32 = "Straw Hat Samurai 2: Game Completed";
         s.products = "Games;Straw Hat Samurai 2;;;event22=" + StatsManager.getTotalTimeTakenSec();
         s.events = "event21,event22,event23";
         s.trackLink(s.pageURL,"o"," Straw Hat Samurai 2 Game Interaction");
         stop();
         StatsManager.stageComplete();
         totalscore.text = (StatsManager.score1 + StatsManager.score2 + StatsManager.score3 + StatsManager.score4).toString();
         timeTaken.text = StatsManager.getTotalTimeTaken();
         hitsTaken.text = (StatsManager.hitsTaken1 + StatsManager.hitsTaken2 + StatsManager.hitsTaken3 + StatsManager.hitsTaken4).toString();
         slashes.text = (StatsManager.slashes1 + StatsManager.slashes2 + StatsManager.slashes3 + StatsManager.slashes4).toString();
         kills.text = (StatsManager.kills1 + StatsManager.kills2 + StatsManager.kills3 + StatsManager.kills4).toString();
         headshots.text = (StatsManager.headshots1 + StatsManager.headshots2 + StatsManager.headshots3 + StatsManager.headshots4).toString();
         deaths.text = (StatsManager.deaths1 + StatsManager.deaths2 + StatsManager.deaths3 + StatsManager.deaths4).toString();
         max = StatsManager.maxCombo1;
         if(StatsManager.maxCombo2 > max)
         {
            max = StatsManager.maxCombo2;
         }
         if(StatsManager.maxCombo3 > max)
         {
            max = StatsManager.maxCombo3;
         }
         if(StatsManager.maxCombo4 > max)
         {
            max = StatsManager.maxCombo4;
         }
         maxCombo.text = max.toString();
         enemiesLaunched.text = (StatsManager.enemiesLaunched1 + StatsManager.enemiesLaunched2 + StatsManager.enemiesLaunched3 + StatsManager.enemiesLaunched4).toString();
         enemiesStabbed.text = (StatsManager.enemiesStabbed1 + StatsManager.enemiesStabbed2 + StatsManager.enemiesStabbed3 + StatsManager.enemiesStabbed4).toString();
         lutbutton.addEventListener(MouseEvent.CLICK,lut2ClickEvent);
         submitbutton.addEventListener(MouseEvent.CLICK,submitClickEvent);
         backbutton.addEventListener(MouseEvent.CLICK,mmbackClickEvent);
      }
      
      public function submitClickEvent(param1:Event) : void
      {
         var event:Event = param1;
         submitbutton.visible = false;
         MochiScores.showLeaderboard({
            "boardID":"0dd38358d73fcd4f",
            "score":StatsManager.getTotalScore(),
            "onClose":function():*
            {
            }
         });
      }
      
      public function configActionSource() : void
      {
         s = new ActionSource();
         s.account = "channel4e4com";
         s.pageName = "";
         s.pageURL = "";
         s.charSet = "ISO-8859-1";
         s.currencyCode = "GBP";
         s.trackClickMap = false;
         s.debugTracking = true;
         s.trackLocal = true;
         s.trackingServer = "st.e4.com";
         s.visitorNamespace = "e4";
         s.dc = 112;
         addChild(s);
      }
      
      public function reportKeyUp(param1:KeyboardEvent) : void
      {
         if(initMode)
         {
            return;
         }
         switch(param1.keyCode)
         {
            case 27:
            case 80:
            case 49:
               InputManager.instance.pauseGame();
               break;
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
               InputManager.instance.activatePower();
         }
      }
      
      public function mouseUpEvent(param1:MouseEvent) : *
      {
         if(initMode)
         {
            return;
         }
         InputManager.instance.mouseUp(mouseX,mouseY,canvas);
      }
      
      internal function frame1() : *
      {
         _mochiads_game_id = "6e1417aae2e91c68";
         MochiServices.connect("6e1417aae2e91c68",root);
         stage.showDefaultContextMenu = false;
         MochiBot.track(this,"42400d91");
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
      
      public function mmcreditsClickEvent(param1:Event) : void
      {
         mm_credits.visible = true;
         mainmenu.visible = false;
      }
      
      internal function frame521() : *
      {
         SoundManager.instance.playBoom();
         SoundManager.instance.playBoom();
         SoundManager.instance.playBoom();
      }
      
      internal function frame2() : *
      {
         gotoAndPlay(1,"e4 intro");
      }
      
      public function skipClickEvent(param1:Event) : void
      {
         gotoAndStop(1,"fortwalls");
      }
      
      internal function frame4() : *
      {
         stop();
         MovieClip(this.getChildByName("loader1")).stop();
         addEventListener(Event.ENTER_FRAME,checkProgress,false,0,true);
         configActionSource();
      }
      
      public function goFullScreen() : *
      {
         stage.displayState = StageDisplayState.FULL_SCREEN;
      }
      
      public function resetStage() : *
      {
         stage.frameRate = 24;
         gotoAndStop(1,"reset");
      }
      
      public function backClickEvent(param1:Event) : void
      {
         mm_stageselect.visible = false;
         mm_credits.visible = false;
         mainmenu.visible = true;
      }
      
      internal function frame423() : *
      {
         stop();
         initMode = false;
         ParticleSystemManager.instance.init();
         EnemyManager.instance.init(enemyLayer);
         ProjectileManager.instance.init(enemyLayer);
         InputManager.instance.enable();
         playerhp.visible = true;
         bosshp.visible = false;
         bossoverheat.visible = false;
         Player.instance.updateHPBar();
         pausemsg.visible = false;
         diedDialog.visible = false;
         hitcombocount.visible = false;
         SoundManager.instance.playMusic(4);
         new BattlefieldStage(Player.instance);
         ParticleSystemManager.instance.createParticleSystem(GrassParticleSystem.typeCode,900,200,leaflayer1);
         StatsManager.reset();
         Player.instance.updateScore(0);
         if(Boolean(SoundManager.instance.canPlayMusic) && Boolean(SoundManager.instance.canPlaySounds))
         {
            mutebutton.gotoAndStop(2);
         }
         else if(!SoundManager.instance.canPlayMusic && Boolean(SoundManager.instance.canPlaySounds))
         {
            mutebutton.gotoAndStop(3);
         }
         else if(!SoundManager.instance.canPlayMusic && !SoundManager.instance.canPlaySounds)
         {
            mutebutton.gotoAndStop(4);
         }
         mutebutton.buttonMode = true;
         mutebutton.addEventListener(MouseEvent.CLICK,muteClickEvent);
      }
      
      internal function frame424() : *
      {
         SoundManager.instance.playMusic(8);
      }
      
      public function lut2ClickEvent(param1:Event) : void
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
      
      public function normalScreen() : *
      {
         stage.displayState = StageDisplayState.NORMAL;
      }
      
      internal function frame79() : *
      {
         if(loaderInfo.url.indexOf("kongregate.com") == -1)
         {
            stop();
         }
      }
      
      internal function frame326() : *
      {
         stop();
         initMode = false;
         ParticleSystemManager.instance.init();
         EnemyManager.instance.init(enemyLayer);
         ProjectileManager.instance.init(enemyLayer);
         InputManager.instance.enable();
         playerhp.visible = true;
         bosshp.visible = false;
         Player.instance.updateHPBar();
         pausemsg.visible = false;
         diedDialog.visible = false;
         hitcombocount.visible = false;
         tutorial.visible = false;
         SoundManager.instance.playMusic(3);
         new MountainStage(Player.instance);
         ParticleSystemManager.instance.createParticleSystem(LeafParticleSystem.typeCode,360,0,leaflayer1);
         Player.instance.initMoveTo(139,350);
         StatsManager.reset();
         Player.instance.updateScore(0);
         if(Boolean(SoundManager.instance.canPlayMusic) && Boolean(SoundManager.instance.canPlaySounds))
         {
            mutebutton.gotoAndStop(2);
         }
         else if(!SoundManager.instance.canPlayMusic && Boolean(SoundManager.instance.canPlaySounds))
         {
            mutebutton.gotoAndStop(3);
         }
         else if(!SoundManager.instance.canPlayMusic && !SoundManager.instance.canPlaySounds)
         {
            mutebutton.gotoAndStop(4);
         }
         mutebutton.buttonMode = true;
         mutebutton.addEventListener(MouseEvent.CLICK,muteClickEvent);
      }
      
      internal function frame327() : *
      {
         SoundManager.instance.playMusic(4);
      }
      
      public function checkProgress(param1:Event = null) : *
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:String = null;
         _loc2_ = stage.loaderInfo.bytesTotal;
         _loc3_ = stage.loaderInfo.bytesLoaded;
         _loc4_ = _loc3_ / _loc2_ * 100;
         _loc5_ = String(Math.round(_loc4_)) + "%";
         MovieClip(this.getChildByName("loader1")).pb.percentagebartext.text = _loc5_;
         MovieClip(this.getChildByName("loader1")).progress.scaleX = _loc4_ / 100;
         if(_loc3_ >= _loc2_)
         {
            this.removeEventListener(Event.ENTER_FRAME,checkProgress);
            _loc5_ = "complete";
            MovieClip(this.getChildByName("loader1")).gotoAndPlay("Done");
            this.gotoAndPlay(2);
         }
      }
      
      public function mmstageselectClickEvent(param1:Event) : void
      {
         mm_stageselect.visible = true;
         mainmenu.visible = false;
         mm_stageselect.updateLocks();
      }
      
      internal function frame229() : *
      {
         stop();
         initMode = false;
         ParticleSystemManager.instance.init();
         EnemyManager.instance.init(enemyLayer);
         ProjectileManager.instance.init(enemyLayer);
         playerhp.visible = true;
         bosshp.visible = false;
         Player.instance.updateHPBar();
         pausemsg.visible = false;
         diedDialog.visible = false;
         hitcombocount.visible = false;
         SoundManager.instance.playMusic(4);
         new ForestStage(Player.instance);
         ParticleSystemManager.instance.createParticleSystem(LeafParticleSystem.typeCode,360,0,leaflayer1);
         StatsManager.reset();
         Player.instance.updateScore(0);
         if(Boolean(SoundManager.instance.canPlayMusic) && Boolean(SoundManager.instance.canPlaySounds))
         {
            mutebutton.gotoAndStop(2);
         }
         else if(!SoundManager.instance.canPlayMusic && Boolean(SoundManager.instance.canPlaySounds))
         {
            mutebutton.gotoAndStop(3);
         }
         else if(!SoundManager.instance.canPlayMusic && !SoundManager.instance.canPlaySounds)
         {
            mutebutton.gotoAndStop(4);
         }
         mutebutton.buttonMode = true;
         mutebutton.addEventListener(MouseEvent.CLICK,muteClickEvent);
      }
      
      internal function frame230() : *
      {
         SoundManager.instance.playMusic(3);
      }
      
      internal function frame473() : *
      {
         stop();
         initMode = false;
         ParticleSystemManager.instance.init();
         EnemyManager.instance.init(enemyLayer);
         ProjectileManager.instance.init(enemyLayer);
         InputManager.instance.enable();
         SoundManager.instance.playMusic(5);
         playerhp.visible = true;
         bosshp.visible = false;
         Player.instance.updateHPBar();
         pausemsg.visible = false;
         pausemsg.travelmeter.visible = false;
         diedDialog.visible = false;
         hitcombocount.visible = false;
         new FortWallsStage(Player.instance);
         Player.instance.gotoAndStop(2);
         StatsManager.reset();
         Player.instance.updateScore(0);
         if(Boolean(SoundManager.instance.canPlayMusic) && Boolean(SoundManager.instance.canPlaySounds))
         {
            mutebutton.gotoAndStop(2);
         }
         else if(!SoundManager.instance.canPlayMusic && Boolean(SoundManager.instance.canPlaySounds))
         {
            mutebutton.gotoAndStop(3);
         }
         else if(!SoundManager.instance.canPlayMusic && !SoundManager.instance.canPlaySounds)
         {
            mutebutton.gotoAndStop(4);
         }
         mutebutton.buttonMode = true;
         mutebutton.addEventListener(MouseEvent.CLICK,muteClickEvent);
      }
      
      public function shs1ClickEvent(param1:Event) : void
      {
         var url:String = null;
         var request:URLRequest = null;
         var event:Event = param1;
         url = "http://www.e4.com/game/straw-hat-samurai/play.e4 ";
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
      
      internal function frame472() : *
      {
         initMode = true;
         stop();
         skipbutton.addEventListener(MouseEvent.CLICK,skipClickEvent);
      }
      
      public function mmnewgameClickEvent(param1:Event) : void
      {
         initMode = true;
         s.linkTrackVars = "eVar4,eVar32,products,events";
         s.linkTrackEvents = "event20,event23";
         s.eVar4 = "e4.com";
         s.eVar32 = "Straw Hat Samurai 2: Game Play";
         s.products = "Games;Straw Hat Samurai 2";
         s.events = "event20,event23";
         s.trackLink(s.pageURL,"o"," Straw Hat Samurai 2 Game Interaction");
         gotoAndPlay(1,"intromap");
      }
      
      internal function frame593() : *
      {
         SoundManager.instance.playToBeContinued();
      }
      
      public function mmcontinuegameClickEvent(param1:Event) : void
      {
         initMode = true;
         if(!StatsManager.stage1completed || StatsManager.stage4completed)
         {
            gotoAndPlay(1,"beforeforest");
         }
         else if(!StatsManager.stage2completed)
         {
            gotoAndPlay(1,"beforemountain");
         }
         else if(!StatsManager.stage3completed)
         {
            gotoAndPlay(1,"beforebattlefield");
         }
         else
         {
            gotoAndPlay(1,"beforefortwalls");
         }
      }
      
      public function mmhiscoresClickEvent(param1:Event) : void
      {
         var event:Event = param1;
         MochiScores.showLeaderboard({
            "boardID":"0dd38358d73fcd4f",
            "onClose":function():*
            {
            }
         });
      }
      
      internal function frame474() : *
      {
         SoundManager.instance.playMusic(9);
         initMode = true;
      }
      
      public function e4ClickEvent(param1:Event) : void
      {
         var url:String = null;
         var request:URLRequest = null;
         var event:Event = param1;
         url = "http://www.e4.com/games/";
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
      
      public function gameloop(param1:Event) : void
      {
         if(initMode || Boolean(Player.instance.gamePaused))
         {
            return;
         }
         ++StatsManager.timeTaken;
         Player.instance.update();
         if(!Player.instance.powerOn)
         {
            ParticleSystemManager.instance.update();
            GameStage.getStage().update();
            EnemyManager.instance.update();
            ProjectileManager.instance.update();
         }
      }
      
      internal function frame131() : *
      {
         stop();
         initMode = false;
         ParticleSystemManager.instance.init();
         EnemyManager.instance.init(enemyLayer);
         ProjectileManager.instance.init(enemyLayer);
         StatsManager.loadData();
         playerhp.visible = false;
         bosshp.visible = false;
         pausemsg.visible = false;
         diedDialog.visible = false;
         player.visible = false;
         InputManager.instance.disable();
         mm_stageselect.visible = false;
         mm_credits.visible = false;
         new ForestStage(Player.instance);
         ForestStage.instance.autoScroll = true;
         ParticleSystemManager.instance.createParticleSystem(LeafParticleSystem.typeCode,360,0,leaflayer1);
         mainmenu.mmnewgamebutton.addEventListener(MouseEvent.CLICK,mmnewgameClickEvent);
         mainmenu.mmcontinuegamebutton.addEventListener(MouseEvent.CLICK,mmcontinuegameClickEvent);
         mainmenu.mmstageselectbutton.addEventListener(MouseEvent.CLICK,mmstageselectClickEvent);
         mainmenu.mmhiscoresbutton.addEventListener(MouseEvent.CLICK,mmhiscoresClickEvent);
         mainmenu.mmcreditstbutton.addEventListener(MouseEvent.CLICK,mmcreditsClickEvent);
         lutbutton.addEventListener(MouseEvent.CLICK,lutClickEvent);
         e4button.addEventListener(MouseEvent.CLICK,e4ClickEvent);
         shs1button.addEventListener(MouseEvent.CLICK,shs1ClickEvent);
      }
      
      public function goNextStage() : *
      {
         if(GameStage.currentStage == 1)
         {
            gotoAndPlay(1,"beforemountain");
         }
         else if(GameStage.currentStage == 2)
         {
            gotoAndPlay(1,"beforebattlefield");
         }
         else if(GameStage.currentStage == 3)
         {
            gotoAndPlay(1,"beforefortwalls");
         }
         else if(GameStage.currentStage == 4)
         {
            gotoAndPlay(1,"cutscene3");
         }
      }
      
      public function goMainMenu() : *
      {
         initMode = true;
         introMode = true;
         stage.frameRate = 24;
         SoundManager.instance.stopMusic();
         gotoAndStop(1,"mainmenu");
      }
      
      internal function frame130() : *
      {
         initMode = true;
         introMode = true;
         new InputManager();
         new EnemyManager();
         new ProjectileManager();
         new ParticleSystemManager();
         new SoundManager();
         stage.addEventListener(Event.ENTER_FRAME,gameloop);
         stage.addEventListener(MouseEvent.MOUSE_MOVE,mouseMoveEvent);
         stage.addEventListener(MouseEvent.MOUSE_DOWN,mouseDownEvent);
         stage.addEventListener(MouseEvent.MOUSE_UP,mouseUpEvent);
         stage.addEventListener(KeyboardEvent.KEY_DOWN,reportKeyDown);
         stage.addEventListener(KeyboardEvent.KEY_UP,reportKeyUp);
      }
      
      internal function frame133() : *
      {
         SoundManager.instance.playMusic(4);
      }
      
      public function reportKeyDown(param1:KeyboardEvent) : void
      {
         if(initMode)
         {
            return;
         }
         switch(param1.keyCode)
         {
            case Keyboard.SPACE:
         }
      }
      
      public function mmbackClickEvent(param1:Event) : void
      {
         gotoAndPlay(1,"mainmenu");
      }
      
      internal function frame132() : *
      {
         stop();
         SoundManager.instance.playMusic(8);
      }
      
      public function goFortWalls() : *
      {
         gotoAndStop(1,"fortwalls");
      }
      
      public function trackDied() : *
      {
         s.linkTrackVars = "eVar32,products,events";
         s.linkTrackEvents = "event22,event23";
         s.eVar32 = "Straw Hat Samurai 2: Game Over";
         s.products = "Games;Straw Hat Samurai 2;;;event22=" + StatsManager.getTotalTimeTakenSec();
         s.events = "event22,event23";
         s.trackLink(s.pageURL,"o"," Straw Hat Samurai 2 Game Interaction");
      }
      
      public function mouseDownEvent(param1:MouseEvent) : *
      {
         if(initMode)
         {
            return;
         }
         InputManager.instance.mouseDown(mouseX,mouseY,canvas);
      }
   }
}


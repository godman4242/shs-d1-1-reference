package shs2_kon_fla
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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1423")]
   public dynamic class boss2_introanim_344 extends MovieClip
   {
      
      public var enemy:MovieClip;
      
      public function boss2_introanim_344()
      {
         super();
         addFrameScript(0,frame1,1,frame2,2,frame3,3,frame4,4,frame5,5,frame6,6,frame7,7,frame8,8,frame9,9,frame10,10,frame11,11,frame12,12,frame13,13,frame14,14,frame15,15,frame16,16,frame17,17,frame18,18,frame19,19,frame20,20,frame21,21,frame22,22,frame23,23,frame24,24,frame25,25,frame26,26,frame27,27,frame28,28,frame29,29,frame30,30,frame31,31,frame32,32,frame33,33,frame34,34,frame35,35,frame36,36,frame37,37,frame38,38,frame39,39,frame40,40,frame41,41,frame42,42,frame43,43,frame44,44,frame45,45,frame46,46,frame47,47,frame48,48,frame49,49,frame50,50,frame51,51,frame52,52,frame53,53,frame54,54,frame55,55,frame56,56,frame57,57,frame58,58,frame59,59,frame60,60,frame61,61,frame62,62,frame63,63,frame64,64,frame65,65,frame66,66,frame67,67,frame68,68,frame69,69,frame70,70,frame71,71,frame72,72,frame73,73,frame74,74,frame75,75,frame76,76,frame77,77,frame78,78,frame79,79,frame80,160,frame161);
      }
      
      internal function frame161() : *
      {
         stop();
         MountainStage.instance.notifyCanMoveUp();
         Boss2.instance.setPosition(600,-700);
         Boss2.instance.doIdle();
         Boss2.instance.createFireBombFromTop(Player.instance.x);
         Boss2.instance.canMove = true;
      }
      
      internal function frame10() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame14() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame16() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame15() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame18() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame19() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame12() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame17() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame3() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame13() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame5() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame6() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame7() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame1() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame22() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame4() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame24() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame25() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame26() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame9() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame2() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame23() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame21() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame8() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame11() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame30() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame29() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame35() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame36() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame37() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame27() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame28() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame20() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame38() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame31() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame32() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame34() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame33() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame40() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame39() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame43() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame44() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame45() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame46() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame47() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame41() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame48() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame49() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame42() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame51() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame52() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame53() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame54() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame55() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame56() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame50() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame58() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame59() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame57() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame60() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame61() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame62() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame63() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame64() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame65() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame66() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame67() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame68() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame69() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame70() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame72() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame73() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame75() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame77() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame71() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame76() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame78() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame74() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame79() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
      
      internal function frame80() : *
      {
         MovieClip(parent.parent.parent.parent).bosshp.hpbar.width = MovieClip(parent.parent.parent.parent).bosshp.hpbar.width + 4;
         MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width = MovieClip(parent.parent.parent.parent).bosshp.hurtbar.width + 4;
      }
   }
}


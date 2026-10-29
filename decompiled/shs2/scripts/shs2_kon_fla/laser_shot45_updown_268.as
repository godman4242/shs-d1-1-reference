package shs2_kon_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1740")]
   public dynamic class laser_shot45_updown_268 extends MovieClip
   {
      
      public var flames:MovieClip;
      
      public var laser:MovieClip;
      
      public function laser_shot45_updown_268()
      {
         super();
         addFrameScript(14,frame15,16,frame17,18,frame19,21,frame22,23,frame24);
      }
      
      internal function frame15() : *
      {
         Boss4.instance.checkEnemyWeaponHitPlayer(laser);
      }
      
      internal function frame17() : *
      {
         Boss4.instance.checkEnemyWeaponHitPlayer(laser);
      }
      
      internal function frame24() : *
      {
         Boss4.instance.checkEnemyWeaponHitPlayer(laser);
      }
      
      internal function frame19() : *
      {
         Boss4.instance.checkEnemyWeaponHitPlayer(laser);
      }
      
      internal function frame22() : *
      {
         Boss4.instance.checkEnemyWeaponHitPlayer(laser);
      }
   }
}


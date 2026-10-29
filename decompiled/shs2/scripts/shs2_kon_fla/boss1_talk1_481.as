package shs2_kon_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol937")]
   public dynamic class boss1_talk1_481 extends MovieClip
   {
      
      public var enemy:MovieClip;
      
      public function boss1_talk1_481()
      {
         super();
         addFrameScript(5,frame6);
      }
      
      internal function frame6() : *
      {
         ForestStage.instance.showBossHP();
         stop();
      }
   }
}


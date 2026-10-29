package shs3_fla
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3456")]
   public dynamic class CharSlot_126 extends MovieClip
   {
      
      public var button:SimpleButton;
      
      public var §1t15966s0§:SimpleButton;
      
      public var inside:TextField;
      
      public var insidelevel:TextField;
      
      public function CharSlot_126()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      internal function frame1() : *
      {
         this.inside.mouseEnabled = false;
         this.insidelevel.mouseEnabled = false;
      }
   }
}


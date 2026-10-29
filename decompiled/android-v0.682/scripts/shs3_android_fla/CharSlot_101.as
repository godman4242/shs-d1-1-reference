package shs3_android_fla
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2780")]
   public dynamic class CharSlot_101 extends MovieClip
   {
      
      public var insidelevel:TextField;
      
      public var button:SimpleButton;
      
      public var inside:TextField;
      
      public var chardeletebutton:SimpleButton;
      
      public function CharSlot_101()
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


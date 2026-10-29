package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3543")]
   public class §1t5146s0§ extends MovieClip
   {
      
      public var §1t5147s0§:MovieClip;
      
      internal var §1t5148s0§:String;
      
      internal var §1t5149s0§:Boolean;
      
      public function §1t5146s0§()
      {
         super();
         addFrameScript(0,this.frame1,5,this.frame6,19,this.frame20,24,this.frame25);
         this.visible = false;
         §1t1521s0§.§1t9290s0§(this.§1t5147s0§.§1t15877s0§.colorText);
      }
      
      public function init(param1:int) : *
      {
         gotoAndPlay(1);
         this.visible = true;
         this.§1t5147s0§.visible = false;
         switch(param1)
         {
            case 1:
               this.§1t5148s0§ = §1t1521s0§.getString(104);
               break;
            case 2:
               this.§1t5148s0§ = §1t1521s0§.getString(105);
               break;
            case 3:
               this.§1t5148s0§ = §1t1521s0§.getString(106);
               break;
            case 4:
            case 14:
               this.§1t5148s0§ = §1t1521s0§.getString(107);
               break;
            case 8:
               this.§1t5148s0§ = §1t1521s0§.getString(254);
               break;
            case 9:
            case 10:
               this.§1t5148s0§ = §1t1521s0§.getString(104);
               break;
            case 1000:
               this.§1t5148s0§ = "ENTERING PVP ZONE";
               this.§1t5149s0§ = true;
               stop();
               break;
            case 1001:
               this.§1t5148s0§ = "LEAVING PVP ZONE";
               break;
            case 1002:
               this.§1t5148s0§ = "ENTERING PVE ZONE";
               this.§1t5149s0§ = true;
               stop();
               break;
            case 1003:
               this.§1t5148s0§ = "LEAVING PVE ZONE";
               break;
            case 0:
            case 5:
            case 11:
            case 6:
            case 12:
               this.§1t5148s0§ = "";
               this.visible = false;
         }
         this.§1t5147s0§.§1t15877s0§.colorText.text = this.§1t5148s0§;
      }
      
      public function §1t5150s0§() : *
      {
         if(this.§1t5149s0§)
         {
            play();
         }
         this.§1t5149s0§ = false;
      }
      
      public function introEnd() : *
      {
         this.visible = false;
      }
      
      internal function frame1() : *
      {
         this.§1t5147s0§.visible = false;
      }
      
      internal function frame6() : *
      {
         this.§1t5147s0§.visible = true;
      }
      
      internal function frame20() : *
      {
         this.§1t5147s0§.visible = false;
      }
      
      internal function frame25() : *
      {
         this.introEnd();
         stop();
      }
   }
}


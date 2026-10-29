package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1165")]
   public class §1t6513s0§ extends MovieClip
   {
      
      internal static var §1t5101s0§:int = 35;
      
      internal static var §1t5099s0§:int = 366;
      
      internal static var §1t5098s0§:int = 15;
      
      public var §1t5438s0§:§1t5488s0§;
      
      public var npcName:TextField;
      
      public var optionBodyText:TextField;
      
      internal var §1t6823s0§:Vector.<§1t127s0§>;
      
      public function §1t6513s0§()
      {
         super();
         addFrameScript(0,this.frame1);
         this.§1t6823s0§ = new Vector.<§1t127s0§>();
         this.§1t5438s0§.visible = false;
         this.visible = false;
         §1t1521s0§.§1t9290s0§(this.optionBodyText);
         §1t1521s0§.§1t9290s0§(this.npcName);
         this.§1t5438s0§.§1t5492s0§();
         this.optionBodyText.condenseWhite = true;
         this.optionBodyText.mouseEnabled = false;
      }
      
      internal function §1t6824s0§() : *
      {
         var _loc2_:§1t127s0§ = null;
         var _loc3_:int = 0;
         var _loc1_:int = int(this.§1t6823s0§.length);
         if(_loc1_ > 0)
         {
            _loc3_ = 0;
            while(_loc3_ < _loc1_)
            {
               _loc2_ = this.§1t6823s0§.pop();
               _loc2_.removeEventListener(MouseEvent.CLICK,this.§1t6777s0§);
               removeChild(_loc2_);
               _loc3_++;
            }
         }
      }
      
      public function show(param1:int, param2:String, param3:Vector.<§1t405s0§>) : *
      {
         var _loc4_:§1t127s0§ = null;
         var _loc8_:int = 0;
         if(param2 == "")
         {
            gotoAndStop(2);
         }
         else
         {
            gotoAndStop(1);
         }
         this.npcName.text = §1t1523s0§.charname;
         this.optionBodyText.text = "";
         this.optionBodyText.htmlText = param2;
         var _loc5_:int = 0;
         var _loc6_:int = int(param3.length);
         var _loc7_:int = 0;
         while(_loc7_ < _loc6_)
         {
            if(param3[_loc7_].§1t794s0§())
            {
               _loc4_ = new §1t127s0§(param3[_loc7_],§1t5098s0§,§1t5099s0§ + §1t5101s0§ * _loc5_);
               _loc4_.addEventListener(MouseEvent.CLICK,this.§1t6777s0§);
               addChild(_loc4_);
               this.§1t6823s0§.push(_loc4_);
               _loc5_++;
            }
            _loc7_++;
         }
         this.visible = true;
         if(param1 != -999)
         {
            if(param1 == -2)
            {
               this.§1t5438s0§.§1t5490s0§();
            }
            else
            {
               this.§1t5438s0§.§1t5489s0§(param1);
            }
            this.§1t5438s0§.visible = true;
            setChildIndex(this.§1t5438s0§,numChildren - 1);
         }
         if(param2 == "random")
         {
            _loc8_ = Math.random() * _loc6_;
            _loc4_ = this.§1t6823s0§[_loc8_];
            this.§1t5438s0§.visible = false;
            this.visible = false;
            _loc4_.§1t795s0§();
            §1t126s0§.§1t9190s0§().§1t1693s0§(_loc4_);
            this.§1t6824s0§();
         }
         else if(param2 == "auto")
         {
            _loc4_ = this.§1t6823s0§[0];
            this.§1t5438s0§.visible = false;
            this.visible = false;
            _loc4_.§1t795s0§();
            §1t126s0§.§1t9190s0§().§1t1693s0§(_loc4_);
            this.§1t6824s0§();
         }
      }
      
      public function §1t6777s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         this.§1t5438s0§.visible = false;
         this.visible = false;
         this.§1t6824s0§();
         param1.currentTarget.§1t795s0§();
         §1t126s0§.§1t9190s0§().§1t1693s0§(param1.currentTarget as §1t127s0§);
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}


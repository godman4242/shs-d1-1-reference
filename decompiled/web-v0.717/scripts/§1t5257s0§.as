package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1400")]
   public class §1t5257s0§ extends MovieClip
   {
      
      public var exit_e:§1t5256s0§;
      
      public var exit_n:§1t5256s0§;
      
      public var exit_s:§1t5256s0§;
      
      public var exit_w:§1t5256s0§;
      
      public var §1t5262s0§:MovieClip;
      
      internal var §1t5263s0§:Array = new Array();
      
      internal var §1t1746s0§:Array;
      
      public function §1t5257s0§()
      {
         super();
         this.§1t5263s0§[0] = this.exit_n;
         this.§1t5263s0§[1] = this.exit_s;
         this.§1t5263s0§[2] = this.exit_e;
         this.§1t5263s0§[3] = this.exit_w;
      }
      
      public function initNodeExits(param1:Array) : *
      {
         this.§1t1746s0§ = param1;
         this.§1t5263s0§[0].gotoAndStop(param1[0] + 1);
         this.§1t5263s0§[1].gotoAndStop(param1[1] + 1);
         this.§1t5263s0§[2].gotoAndStop(param1[2] + 1);
         this.§1t5263s0§[3].gotoAndStop(param1[3] + 1);
      }
      
      internal function §1t5265s0§() : *
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.§1t5263s0§.length)
         {
            if(_loc1_ >= 4)
            {
               removeChild(this.§1t5263s0§[_loc1_]);
            }
            else
            {
               this.§1t5263s0§[_loc1_].gotoAndStop(1);
            }
            _loc1_++;
         }
         this.§1t5263s0§.splice(4,this.§1t5263s0§.length - 4);
      }
      
      public function initIcon(param1:int) : *
      {
         if(param1 == §1t70s0§.§1t9140s0§)
         {
            this.§1t5262s0§.gotoAndStop("town");
         }
         else if(param1 == §1t70s0§.§1t9142s0§ || param1 == §1t70s0§.§1t9152s0§)
         {
            this.§1t5262s0§.gotoAndStop("cave");
         }
         else if(param1 == §1t70s0§.§1t9141s0§)
         {
            this.§1t5262s0§.gotoAndStop("dungeon");
         }
         else if(param1 == §1t70s0§.§1t9143s0§)
         {
            this.§1t5262s0§.gotoAndStop("mine");
         }
         else if(param1 == §1t70s0§.§1t9148s0§)
         {
            this.§1t5262s0§.gotoAndStop("dojo");
         }
         else if(param1 == §1t70s0§.§1t9163s0§)
         {
            this.§1t5262s0§.gotoAndStop("control");
         }
         else
         {
            this.§1t5262s0§.gotoAndStop("nothing");
         }
      }
   }
}


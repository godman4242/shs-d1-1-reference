package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2114")]
   public class §1t7396s0§ extends MovieClip
   {
      
      public var §1t5438s0§:§1t74s0§;
      
      public var §1t7397s0§:MovieClip;
      
      public var §1t6859s0§:TextField;
      
      public var §1t7280s0§:TextField;
      
      internal var index:int;
      
      internal var opened:Boolean;
      
      internal var §1t7399s0§:int;
      
      public function §1t7396s0§()
      {
         super();
         stop();
      }
      
      public function init(param1:int) : *
      {
         this.§1t7399s0§ = param1;
         this.§1t7400s0§();
      }
      
      public function §1t6875s0§(param1:int) : *
      {
         this.index = param1;
      }
      
      public function §1t7400s0§() : *
      {
         gotoAndStop(1);
         this.opened = false;
      }
      
      public function §1t7401s0§(param1:§1t24s0§, param2:String, param3:String, param4:String, param5:String, param6:int, param7:int) : *
      {
         if(this.§1t7402s0§())
         {
            §1t88s0§.instance.§1t1516s0§("Snd_sumo");
         }
         else
         {
            §1t88s0§.instance.§1t1516s0§("Snd_upgradeSkill");
         }
         gotoAndStop(this.§1t7399s0§);
         this.opened = true;
         var _loc8_:§1t413s0§ = new §1t413s0§(null);
         if(this.§1t7399s0§ == 3)
         {
            _loc8_.§1t995s0§(§1t24s0§.§1t8748s0§,400);
            param1.§1t580s0§(§1t24s0§.§1t8748s0§,400);
         }
         else if(this.§1t7399s0§ == 4)
         {
            _loc8_.§1t995s0§(§1t24s0§.§1t8749s0§,50);
            param1.§1t580s0§(§1t24s0§.§1t8749s0§,50);
         }
         else if(this.§1t7399s0§ == 5)
         {
            _loc8_.§1t995s0§(§1t24s0§.§1t8750s0§,50);
            param1.§1t580s0§(§1t24s0§.§1t8750s0§,50);
         }
         else if(this.§1t7399s0§ == 6)
         {
            _loc8_.§1t995s0§(§1t24s0§.§1t8751s0§,50);
            param1.§1t580s0§(§1t24s0§.§1t8751s0§,50);
         }
         else if(this.§1t7399s0§ == 7)
         {
            _loc8_.§1t995s0§(§1t24s0§.§1t8752s0§,50);
            param1.§1t580s0§(§1t24s0§.§1t8752s0§,50);
         }
         else if(this.§1t7399s0§ == 8)
         {
            _loc8_.§1t995s0§(§1t24s0§.§1t8748s0§,800);
            param1.§1t580s0§(§1t24s0§.§1t8748s0§,800);
         }
         else if(this.§1t7399s0§ == 9)
         {
            _loc8_.§1t995s0§(§1t24s0§.§1t8749s0§,100);
            param1.§1t580s0§(§1t24s0§.§1t8749s0§,100);
         }
         else if(this.§1t7399s0§ == 10)
         {
            _loc8_.§1t995s0§(§1t24s0§.§1t8750s0§,100);
            param1.§1t580s0§(§1t24s0§.§1t8750s0§,100);
         }
         else if(this.§1t7399s0§ == 11)
         {
            _loc8_.§1t995s0§(§1t24s0§.§1t8751s0§,100);
            param1.§1t580s0§(§1t24s0§.§1t8751s0§,100);
         }
         else if(this.§1t7399s0§ == 12)
         {
            _loc8_.§1t995s0§(§1t24s0§.§1t8752s0§,100);
            param1.§1t580s0§(§1t24s0§.§1t8752s0§,100);
         }
         else if(this.§1t7399s0§ == 13)
         {
            _loc8_.§1t995s0§(§1t24s0§.§1t8747s0§,1);
            this.§1t5438s0§.§1t5491s0§(param3);
            this.§1t5438s0§.scaleX = 2;
            this.§1t5438s0§.scaleY = 2;
            this.§1t7280s0§.text = param2;
            param1.§1t599s0§(param2,param4,param3,param5,param6,param7);
            §1t3317s0§.instance.§1t1937s0§(§1t1523s0§.charname + " " + param2 + " " + param3);
         }
         else if(this.§1t7399s0§ == 14)
         {
            _loc8_.§1t995s0§(§1t24s0§.§1t8748s0§,200);
            param1.§1t580s0§(§1t24s0§.§1t8748s0§,200);
         }
         else if(this.§1t7399s0§ == 15)
         {
            _loc8_.§1t995s0§(§1t24s0§.§1t8749s0§,25);
            param1.§1t580s0§(§1t24s0§.§1t8749s0§,25);
         }
         else if(this.§1t7399s0§ == 16)
         {
            _loc8_.§1t995s0§(§1t24s0§.§1t8750s0§,25);
            param1.§1t580s0§(§1t24s0§.§1t8750s0§,25);
         }
         else if(this.§1t7399s0§ == 17)
         {
            _loc8_.§1t995s0§(§1t24s0§.§1t8751s0§,25);
            param1.§1t580s0§(§1t24s0§.§1t8751s0§,25);
         }
         else if(this.§1t7399s0§ == 18)
         {
            _loc8_.§1t995s0§(§1t24s0§.§1t8752s0§,25);
            param1.§1t580s0§(§1t24s0§.§1t8752s0§,25);
         }
         §1t412s0§.instance.§1t7616s0§(null,x + width / 2,y + width / 2,_loc8_);
      }
      
      public function §1t7402s0§() : Boolean
      {
         return this.§1t7399s0§ > 7 && this.§1t7399s0§ < 14;
      }
      
      public function §1t3312s0§() : Boolean
      {
         return this.§1t7399s0§ == 13;
      }
      
      public function §1t7403s0§(param1:String, param2:String) : *
      {
         if(!this.opened)
         {
            gotoAndStop(this.§1t7399s0§);
            if(this.§1t7399s0§ == 13)
            {
               this.§1t5438s0§.§1t5491s0§(param2);
               this.§1t5438s0§.scaleX = 2;
               this.§1t5438s0§.scaleY = 2;
               this.§1t7280s0§.text = param1;
            }
         }
      }
      
      public function §1t7404s0§() : *
      {
         if(!this.opened)
         {
            gotoAndStop(2);
         }
      }
      
      public function §1t7405s0§() : *
      {
         if(!this.opened)
         {
            gotoAndStop(1);
         }
      }
   }
}


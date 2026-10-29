package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3605")]
   public class §1t5184s0§ extends MovieClip
   {
      
      public var canvas:§1t5016s0§;
      
      public var keypressText:TextField;
      
      public var §1t6959s0§:TextField;
      
      public var shade:MovieClip;
      
      internal var §1t6961s0§:int = 0;
      
      internal var §1t6962s0§:int = 0;
      
      internal var image:MovieClip = null;
      
      internal var cooldown:int = 0;
      
      internal var cooldownmax:int = 0;
      
      internal var chiCost:int = 0;
      
      internal var disabled:Boolean;
      
      public function §1t5184s0§()
      {
         super();
         this.canvas.mouseEnabled = false;
         this.§1t6959s0§.mouseEnabled = false;
         this.shade.gotoAndStop(1);
      }
      
      public function §1t6966s0§(param1:§1t57s0§) : *
      {
         this.§1t6961s0§ = param1.§1t760s0§();
         this.§1t6962s0§ = param1.§1t761s0§();
         this.shade.visible = true;
         if(this.§1t6961s0§ == 0)
         {
            this.§1t6967s0§();
            return;
         }
         switch(this.§1t6962s0§)
         {
            case 0:
            case 1:
               this.§1t6959s0§.text = "";
               break;
            case 2:
               this.§1t6959s0§.text = "II";
               break;
            case 3:
               this.§1t6959s0§.text = "III";
               break;
            case 4:
               this.§1t6959s0§.text = "IV";
               break;
            case 5:
               this.§1t6959s0§.text = "V";
               break;
            case 6:
               this.§1t6959s0§.text = "VI";
               break;
            case 7:
               this.§1t6959s0§.text = "VII";
               break;
            case 8:
               this.§1t6959s0§.text = "VIII";
               break;
            case 9:
               this.§1t6959s0§.text = "IX";
               break;
            case 10:
               this.§1t6959s0§.text = "X";
         }
         if(this.image != null)
         {
            this.canvas.removeChild(this.image);
         }
         this.image = §1t1522s0§.§1t9317s0§(this.§1t6961s0§);
         if(this.image != null)
         {
            this.canvas.addChild(this.image);
            this.image.mouseEnabled = false;
         }
         var _loc2_:§1t105s0§ = §1t1524s0§.§1t9863s0§(this.§1t6961s0§);
         if(_loc2_ == null)
         {
            return;
         }
         this.cooldownmax = _loc2_.§1t1465s0§(this.§1t6962s0§);
         this.chiCost = _loc2_.§1t1463s0§(this.§1t6962s0§);
         this.cooldown = this.cooldownmax;
         this.disabled = false;
         if(this.cooldown > 0)
         {
            this.shade.gotoAndStop(12);
            mouseEnabled = false;
         }
         if(this.§1t6974s0§(this.§1t6961s0§))
         {
            this.§1t6959s0§.text = String(§1t1523s0§.§1t9714s0§(2501));
         }
         else if(this.§1t6961s0§ == §1t120s0§.§1t10158s0§)
         {
            this.§1t6959s0§.text = String(Math.floor(§1t1523s0§.§1t9714s0§(2501) / 4));
         }
      }
      
      internal function §1t6974s0§(param1:int) : Boolean
      {
         return param1 == §1t120s0§.§1t10130s0§ || param1 == §1t120s0§.§1t10139s0§ || param1 == §1t120s0§.§1t10140s0§ || param1 == §1t120s0§.§1t10141s0§ || param1 == §1t120s0§.§1t10142s0§ || param1 == §1t120s0§.§1t10134s0§ || param1 == §1t120s0§.§1t10135s0§ || param1 == §1t120s0§.§1t10136s0§ || param1 == §1t120s0§.§1t10137s0§ || param1 == §1t120s0§.§1t10138s0§;
      }
      
      public function §1t6967s0§() : *
      {
         this.§1t6961s0§ = 0;
         this.§1t6962s0§ = 0;
         this.§1t6959s0§.text = "";
         this.keypressText.text = "";
         this.shade.visible = false;
         if(this.image != null)
         {
            this.canvas.removeChild(this.image);
            this.image = null;
         }
      }
      
      public function §1t6975s0§(param1:int) : *
      {
         if(!§1t1523s0§.§1t9528s0§)
         {
            this.keypressText.text = param1.toString();
            this.keypressText.cacheAsBitmap = true;
         }
         else
         {
            this.keypressText.visible = false;
         }
      }
      
      public function §1t6976s0§() : *
      {
         this.disabled = true;
         this.shade.gotoAndStop(13);
      }
      
      public function §1t5198s0§(param1:int) : *
      {
         var _loc3_:int = 0;
         var _loc2_:int = §1t1523s0§.§1t9586s0§().stance;
         if(param1 < this.chiCost || this.§1t6961s0§ == §1t120s0§.§1t10146s0§ && _loc2_ != §1t99s0§.§1t12220s0§ || this.§1t6961s0§ == §1t120s0§.§1t10147s0§ && _loc2_ != §1t99s0§.§1t12221s0§ || this.§1t6961s0§ == §1t120s0§.§1t10148s0§ && _loc2_ != §1t99s0§.§1t12222s0§)
         {
            this.disabled = true;
            this.shade.gotoAndStop(13);
            return;
         }
         if(this.§1t6974s0§(this.§1t6961s0§))
         {
            _loc3_ = §1t1523s0§.§1t9714s0§(2501);
            this.§1t6959s0§.text = _loc3_.toString();
            if(_loc3_ <= 0)
            {
               this.disabled = true;
               this.shade.gotoAndStop(13);
               return;
            }
         }
         else if(this.§1t6961s0§ == §1t120s0§.§1t10158s0§)
         {
            _loc3_ = Math.floor(§1t1523s0§.§1t9714s0§(2501) / 4);
            this.§1t6959s0§.text = _loc3_.toString();
            if(_loc3_ <= 0)
            {
               this.disabled = true;
               this.shade.gotoAndStop(13);
               return;
            }
         }
         if((this.§1t6961s0§ == §1t120s0§.§1t10160s0§ || this.§1t6961s0§ == §1t120s0§.§1t10162s0§) && (§1t1540s0§.§1t10047s0§() || §1t1540s0§.§1t10048s0§()))
         {
            this.disabled = true;
            this.shade.gotoAndStop(13);
            return;
         }
         if(this.disabled)
         {
            this.disabled = false;
            if(this.cooldown == 0)
            {
               this.cooldown = 1;
            }
            this.update();
         }
      }
      
      public function update() : *
      {
         var _loc1_:int = 0;
         if(this.disabled)
         {
            return;
         }
         if(this.cooldown > 0)
         {
            if(this.§1t6961s0§ == §1t120s0§.§1t10146s0§ && §1t1523s0§.§1t9586s0§().stance != §1t99s0§.§1t12220s0§ && this.cooldown < this.cooldownmax)
            {
               return;
            }
            if(this.§1t6961s0§ == §1t120s0§.§1t10147s0§ && §1t1523s0§.§1t9586s0§().stance != §1t99s0§.§1t12221s0§ && this.cooldown < this.cooldownmax)
            {
               return;
            }
            if(this.§1t6961s0§ == §1t120s0§.§1t10148s0§ && §1t1523s0§.§1t9586s0§().stance != §1t99s0§.§1t12222s0§ && this.cooldown < this.cooldownmax)
            {
               return;
            }
            --this.cooldown;
            _loc1_ = Math.ceil(this.cooldown / this.cooldownmax * 12) + 1;
            if(this.shade.currentFrame != _loc1_)
            {
               this.shade.gotoAndStop(_loc1_);
            }
            if(this.cooldown == 0)
            {
               mouseEnabled = true;
            }
         }
      }
      
      public function §1t5484s0§(param1:int = -1, param2:int = -1) : *
      {
         var _loc5_:Boolean = false;
         if(this.cooldown > 0 || this.§1t6961s0§ == 0)
         {
            return;
         }
         var _loc3_:§1t99s0§ = §1t1523s0§.§1t9586s0§();
         var _loc4_:§1t105s0§ = §1t1524s0§.§1t9863s0§(this.§1t6961s0§);
         if(_loc4_ == null)
         {
            return;
         }
         if(param1 != -1 || param2 != -1)
         {
            _loc5_ = §1t120s0§.§1t9190s0§().§1t1542s0§(this.§1t6961s0§,this.§1t6962s0§,_loc3_,null,_loc4_,param1,param2);
         }
         else
         {
            _loc5_ = §1t120s0§.§1t9190s0§().§1t1542s0§(this.§1t6961s0§,this.§1t6962s0§,_loc3_,null,_loc4_);
         }
         if(_loc5_)
         {
            this.cooldownmax = _loc4_.§1t1465s0§(this.§1t6962s0§);
            this.cooldown = this.cooldownmax;
            if(this.cooldown > 0)
            {
               mouseEnabled = false;
            }
         }
      }
      
      public function §1t6977s0§() : *
      {
         var _loc1_:§1t105s0§ = §1t1524s0§.§1t9863s0§(this.§1t6961s0§);
         if(_loc1_ == null)
         {
            return;
         }
         this.cooldownmax = _loc1_.§1t1465s0§(this.§1t6962s0§);
         this.cooldown = this.cooldownmax;
         if(this.cooldown > 0)
         {
            mouseEnabled = false;
         }
      }
      
      public function §1t6963s0§() : int
      {
         return this.§1t6961s0§;
      }
      
      public function §1t4491s0§() : int
      {
         return this.§1t6962s0§;
      }
      
      public function §1t6978s0§() : Boolean
      {
         return this.cooldown == 0 && this.§1t6961s0§ != 0;
      }
      
      public function §1t6979s0§() : *
      {
         this.shade.visible = false;
         this.keypressText.visible = false;
      }
   }
}


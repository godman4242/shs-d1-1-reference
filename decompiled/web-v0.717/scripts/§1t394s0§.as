package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol996")]
   public class §1t394s0§ extends MovieClip
   {
      
      public var coin:MovieClip;
      
      public var §1t6859s0§:TextField;
      
      public var gold:MovieClip;
      
      public var itemMCS:§1t6290s0§;
      
      private var §1t467s0§:§1t98s0§ = new §1t98s0§();
      
      public var item:§1t17s0§;
      
      public var id:int;
      
      public var index:int;
      
      internal var §1t6861s0§:String = "normal";
      
      public var itemImage:MovieClip;
      
      private var §1t6783s0§:Boolean;
      
      private var cost:§1t98s0§ = new §1t98s0§();
      
      private var hcost:* = new §1t98s0§();
      
      internal var §1t6865s0§:int;
      
      internal var §1t6866s0§:int = 0;
      
      public function §1t394s0§()
      {
         super();
         this.mouseChildren = false;
         this.§1t6786s0§(false);
         this.coin.visible = false;
         this.gold.visible = false;
         this.§1t6859s0§.mouseEnabled = false;
      }
      
      public function setItem(param1:§1t17s0§) : §1t17s0§
      {
         this.§1t6861s0§ = param1.§1t508s0§();
         gotoAndStop(this.§1t6861s0§ + "_default");
         this.item = param1;
         return this.item;
      }
      
      public function §1t2217s0§() : §1t17s0§
      {
         return this.item;
      }
      
      public function clearItem() : *
      {
         this.item = null;
      }
      
      public function §1t6868s0§(param1:int, param2:int) : *
      {
         this.cost.§1t695s0§(param1);
         this.hcost.§1t695s0§(param2);
         this.§1t6865s0§ = param2;
         if(param2 > 0)
         {
            this.coin.visible = false;
            this.gold.visible = true;
            this.§1t6859s0§.text = param2.toString();
            this.§1t6866s0§ = 2;
         }
         else if(param1 > 0)
         {
            this.coin.visible = true;
            this.gold.visible = false;
            this.§1t6859s0§.text = param1.toString();
            this.§1t6866s0§ = 1;
         }
         else
         {
            this.coin.visible = true;
            this.gold.visible = false;
            this.§1t6859s0§.text = param1.toString();
            this.§1t6866s0§ = 1;
         }
         this.§1t6859s0§.x = 10;
      }
      
      public function §1t976s0§() : int
      {
         return this.cost.§1t697s0§();
      }
      
      public function §1t6869s0§() : int
      {
         return this.hcost.§1t697s0§();
      }
      
      public function §1t6870s0§(param1:String) : *
      {
         this.§1t6859s0§.text = param1;
         this.§1t6859s0§.x = 20;
         this.§1t6866s0§ = 0;
      }
      
      public function §1t6786s0§(param1:Boolean) : *
      {
         if(param1 == this.§1t6783s0§)
         {
            return;
         }
         this.§1t6783s0§ = param1;
         if(param1)
         {
            gotoAndStop(this.§1t6861s0§ + "_selected");
         }
         else
         {
            gotoAndStop(this.§1t6861s0§ + "_default");
         }
      }
      
      public function §1t483s0§() : int
      {
         return this.§1t467s0§.§1t697s0§();
      }
      
      public function §1t6871s0§() : String
      {
         return §1t1521s0§.getString(§1t1524s0§.§1t9862s0§(this.§1t467s0§.§1t697s0§()).§1t891s0§);
      }
      
      public function §1t6872s0§(param1:int, param2:String, param3:uint = 1, param4:uint = 1) : void
      {
         this.§1t467s0§.§1t695s0§(param1);
         if(param1 == 0)
         {
            this.itemImage = null;
            this.itemMCS.clearItem();
         }
         else if(param1 == 1)
         {
            this.itemMCS.§1t6297s0§(1);
         }
         else if(param1 < 3000 && param1 > 1999)
         {
            this.itemMCS.§1t6297s0§(param1);
         }
         else if(param1 < 4000 && param1 > 2999)
         {
            this.itemMCS.§1t6298s0§(param1);
         }
         else if(param1 < 5000 && param1 > 3999)
         {
            this.itemMCS.§1t6245s0§(param1);
         }
         else if(param1 < 6000 && param1 > 4999)
         {
            this.itemMCS.§1t6262s0§(param1);
         }
         else if(param1 < 7000 && param1 > 5999)
         {
            this.itemMCS.§1t6242s0§(param1);
         }
         else if(param1 < 8000 && param1 > 6999)
         {
            this.itemMCS.§1t6240s0§(param1);
         }
         else if(param1 < 9000 && param1 > 7999)
         {
            this.itemMCS.§1t6239s0§(param1);
         }
         else if(param1 < 10000 && param1 > 8999)
         {
            this.itemMCS.§1t6243s0§(param1);
         }
         else if(!(param1 < 11000 && param1 > 9999))
         {
            if(param1 < 12000 && param1 > 10999)
            {
               this.itemMCS.§1t6264s0§(param1);
            }
            else if(param1 < 13000 && param1 > 11999)
            {
               this.itemMCS.§1t6263s0§(param1);
            }
            else if(param1 < 13500 && param1 > 12999)
            {
               this.itemMCS.§1t6265s0§(param1);
            }
            else if(param1 < 30000 && param1 >= 20000)
            {
               this.itemMCS.§1t6297s0§(param1);
            }
            else
            {
               this.itemMCS.§1t6297s0§(0);
            }
         }
         if(this.itemImage != null)
         {
            addChild(this.itemImage);
            this.setChildIndex(this.§1t6859s0§,numChildren - 1);
            this.itemImage.x = 35;
            this.itemImage.y = 35;
            this.itemImage.mouseEnabled = false;
            this.itemImage.visible = true;
         }
         if(param3 != §1t17s0§.§1t8733s0§)
         {
            this.itemMCS.§1t529s0§(param3);
         }
         if(param4 != §1t17s0§.§1t8733s0§)
         {
            this.itemMCS.§1t530s0§(param4);
         }
         this.§1t6861s0§ = param2;
         gotoAndStop(this.§1t6861s0§ + "_default");
      }
      
      public function §1t529s0§(param1:uint) : *
      {
         this.itemMCS.§1t529s0§(param1);
      }
      
      public function §1t530s0§(param1:uint) : *
      {
         this.itemMCS.§1t530s0§(param1);
      }
      
      public function §1t527s0§() : uint
      {
         return this.item.§1t527s0§();
      }
      
      public function §1t528s0§() : uint
      {
         return this.item.§1t528s0§();
      }
      
      public function §1t6873s0§() : String
      {
         return this.§1t6861s0§;
      }
      
      public function §1t6874s0§() : *
      {
         gotoAndStop(this.§1t6861s0§ + "_default");
         this.§1t6870s0§("");
      }
      
      public function §1t5224s0§() : *
      {
         if(this.itemImage)
         {
            this.itemImage.visible = false;
         }
         this.gold.visible = false;
         this.coin.visible = false;
         this.§1t6870s0§("");
         this.§1t467s0§.§1t695s0§(0);
      }
      
      public function §1t5004s0§() : *
      {
         this.addEventListener(MouseEvent.ROLL_OVER,this.§1t5853s0§);
         this.addEventListener(MouseEvent.ROLL_OUT,this.onMouseOut);
      }
      
      public function removeEventListeners() : *
      {
         this.removeEventListener(MouseEvent.ROLL_OVER,this.§1t5853s0§);
         this.removeEventListener(MouseEvent.ROLL_OUT,this.onMouseOut);
         this.onMouseOut(null);
      }
      
      public function §1t5853s0§(param1:MouseEvent) : void
      {
         if(this.§1t6783s0§)
         {
            gotoAndStop(this.§1t6861s0§ + "_selectedmouseover");
         }
         else
         {
            gotoAndStop(this.§1t6861s0§ + "_mouseover");
         }
      }
      
      public function onMouseOut(param1:MouseEvent) : void
      {
         if(this.§1t6783s0§)
         {
            gotoAndStop(this.§1t6861s0§ + "_selected");
         }
         else
         {
            gotoAndStop(this.§1t6861s0§ + "_default");
         }
      }
      
      public function §1t6875s0§(param1:int) : *
      {
         this.index = param1;
      }
      
      public function §1t6787s0§() : int
      {
         return this.index;
      }
      
      public function getLevel() : int
      {
         return this.item.getLevel();
      }
   }
}


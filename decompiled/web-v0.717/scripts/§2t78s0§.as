package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1457")]
   public class §2t78s0§ extends MovieClip
   {
      
      public var beltitem0:§1t394s0§;
      
      public var beltitem1:§1t394s0§;
      
      public var beltitem2:§1t394s0§;
      
      public var beltitem3:§1t394s0§;
      
      public var beltitem4:§1t394s0§;
      
      public var bg:MovieClip;
      
      public var mouseoveritem:TextField;
      
      public var scrollleftbutton:§1t4912s0§;
      
      public var scrollrightbutton:§1t4912s0§;
      
      internal var itemSlots:Vector.<§1t394s0§> = new Vector.<§1t394s0§>();
      
      internal var itemIndex:* = 0;
      
      internal var inventory:Vector.<§1t17s0§>;
      
      internal var maxitem:int;
      
      public function §2t78s0§()
      {
         super();
         this.itemSlots.push(this.beltitem0);
         this.itemSlots.push(this.beltitem1);
         this.itemSlots.push(this.beltitem2);
         this.itemSlots.push(this.beltitem3);
         this.itemSlots.push(this.beltitem4);
         §1t1521s0§.§1t9290s0§(this.mouseoveritem);
         this.mouseoveritem.text = §1t1521s0§.getString(143);
         var _loc1_:int = 0;
         while(_loc1_ < 5)
         {
            this.itemSlots[_loc1_].buttonMode = true;
            _loc1_++;
         }
      }
      
      public function show() : *
      {
         this.inventory = §1t1523s0§.§1t9368s0§;
         this.inventory = this.inventory.concat(§1t1523s0§.§1t9369s0§);
         this.§1t6895s0§();
         this.§1t5004s0§();
         this.visible = true;
      }
      
      public function §1t6895s0§() : *
      {
         var _loc1_:int = 0;
         this.maxitem = this.inventory.length;
         var _loc2_:int = 0;
         _loc1_ = _loc2_;
         while(_loc1_ < 5)
         {
            if(this.itemIndex + _loc1_ < this.maxitem)
            {
               this.itemSlots[_loc1_].visible = true;
               this.itemSlots[_loc1_].§1t6872s0§(this.inventory[this.itemIndex + _loc1_].§1t483s0§(),this.inventory[this.itemIndex + 1].§1t508s0§());
               this.itemSlots[_loc1_].§1t6859s0§.text = "";
            }
            else
            {
               this.itemSlots[_loc1_].visible = false;
            }
            _loc1_++;
         }
         this.scrollrightbutton.visible = this.maxitem > this.itemIndex + 5;
         this.scrollleftbutton.visible = this.itemIndex != 0;
      }
      
      public function hide() : *
      {
         this.removeEventListeners();
         §1t1541s0§.§1t10097s0§();
         §1t406s0§.instance.§1t6590s0§(true);
         §1t406s0§.instance.§1t6575s0§(true);
         §1t406s0§.instance.§1t6594s0§(true);
         visible = false;
      }
      
      public function §1t5004s0§() : *
      {
         this.scrollrightbutton.addEventListener(MouseEvent.CLICK,this.scrollRight);
         this.scrollleftbutton.addEventListener(MouseEvent.CLICK,this.scrollLeft);
         var _loc1_:int = 0;
         while(_loc1_ < 5)
         {
            this.itemSlots[_loc1_].addEventListener(MouseEvent.MOUSE_OVER,this.mouseOverItem);
            this.itemSlots[_loc1_].addEventListener(MouseEvent.CLICK,this.§1t15865s0§);
            this.itemSlots[_loc1_].§1t5004s0§();
            _loc1_++;
         }
         this.bg.addEventListener(MouseEvent.MOUSE_OVER,this.mouseOverItem);
         this.bg.addEventListener(MouseEvent.CLICK,this.§1t5737s0§);
         §1t1525s0§.§1t9940s0§().addEventListener(MouseEvent.CLICK,this.§1t5737s0§);
      }
      
      public function removeEventListeners() : *
      {
         this.scrollrightbutton.removeEventListener(MouseEvent.CLICK,this.scrollRight);
         this.scrollleftbutton.removeEventListener(MouseEvent.CLICK,this.scrollLeft);
         var _loc1_:int = 0;
         while(_loc1_ < 5)
         {
            this.itemSlots[_loc1_].removeEventListener(MouseEvent.MOUSE_OVER,this.mouseOverItem);
            this.itemSlots[_loc1_].removeEventListener(MouseEvent.CLICK,this.§1t15865s0§);
            this.itemSlots[_loc1_].removeEventListeners();
            _loc1_++;
         }
         this.bg.removeEventListener(MouseEvent.MOUSE_OVER,this.mouseOverItem);
         this.bg.removeEventListener(MouseEvent.CLICK,this.§1t5737s0§);
         §1t1525s0§.§1t9940s0§().removeEventListener(MouseEvent.CLICK,this.§1t5737s0§);
      }
      
      public function §1t15865s0§(param1:MouseEvent) : *
      {
         this.hide();
      }
      
      public function selectSame(param1:MouseEvent) : *
      {
         this.hide();
      }
      
      public function §1t5737s0§(param1:MouseEvent) : *
      {
         if(this.visible == true)
         {
            this.hide();
         }
      }
      
      public function mouseOverItem(param1:MouseEvent) : *
      {
         if(param1.target == this.bg)
         {
            this.mouseoveritem.text = §1t1521s0§.getString(143);
         }
         else
         {
            this.mouseoveritem.text = §1t1521s0§.getString(§1t1524s0§.§1t9862s0§(param1.target.§1t483s0§()).§1t891s0§);
         }
      }
      
      public function scrollRight(param1:MouseEvent) : *
      {
         if(this.itemIndex + 5 < this.maxitem)
         {
            this.itemIndex += 1;
         }
         this.§1t6895s0§();
      }
      
      public function scrollLeft(param1:MouseEvent) : *
      {
         if(this.itemIndex != 0)
         {
            --this.itemIndex;
         }
         this.§1t6895s0§();
      }
   }
}


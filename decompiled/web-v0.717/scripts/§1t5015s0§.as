package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1825")]
   public class §1t5015s0§ extends MovieClip
   {
      
      public static var instance:§1t5015s0§;
      
      public var bg:§1t5016s0§;
      
      public var §1t5017s0§:SimpleButton;
      
      public var §1t5018s0§:TextField;
      
      public var §1t5019s0§:§1t4912s0§;
      
      public var §1t5020s0§:§1t4912s0§;
      
      public var §1t5021s0§:TextField;
      
      internal var §1t5022s0§:Array;
      
      internal var §1t5023s0§:int = 8;
      
      internal var §1t5024s0§:int;
      
      internal var page:int;
      
      public function §1t5015s0§()
      {
         var _loc1_:§1t5009s0§ = null;
         this.§1t5024s0§ = Math.ceil(§1t1524s0§.§1t9783s0§.length / this.§1t5023s0§);
         super();
         instance = this;
         this.§1t5022s0§ = new Array();
         var _loc2_:int = 0;
         while(_loc2_ < this.§1t5023s0§)
         {
            _loc1_ = new §1t5009s0§();
            addChild(_loc1_);
            this.§1t5022s0§.push(_loc1_);
            _loc1_.x = 105 + _loc2_ % 2 * 310;
            _loc1_.y = 74 + Math.floor(_loc2_ / 2) * 88;
            _loc2_++;
         }
         §1t1521s0§.§1t9290s0§(this.§1t5021s0§);
         §1t1521s0§.§1t9290s0§(this.§1t5018s0§);
         this.§1t5021s0§.text = §1t1521s0§.getString(140);
      }
      
      public function show() : *
      {
         this.visible = true;
         this.page = 0;
         this.§1t5025s0§();
         this.§1t5004s0§();
         §1t1525s0§.§1t9940s0§().visible = false;
      }
      
      internal function §1t5025s0§() : *
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.§1t5023s0§)
         {
            this.§1t5022s0§[_loc1_].init(this.page * this.§1t5023s0§ + _loc1_);
            _loc1_++;
         }
         this.§1t5020s0§.visible = this.page != 0;
         this.§1t5019s0§.visible = this.page != this.§1t5024s0§ - 1;
         this.§1t5018s0§.text = §1t1521s0§.getString(719) + (this.page + 1) + "/" + this.§1t5024s0§;
      }
      
      public function §1t5026s0§(param1:MouseEvent) : void
      {
         §1t88s0§.instance.§1t1516s0§("Snd_back");
         this.removeEventListeners();
         this.visible = false;
         §1t1525s0§.§1t9940s0§().visible = true;
      }
      
      internal function §1t5004s0§() : *
      {
         this.§1t5017s0§.addEventListener(MouseEvent.CLICK,this.§1t5026s0§);
         this.§1t5020s0§.addEventListener(MouseEvent.CLICK,this.§1t5027s0§);
         this.§1t5019s0§.addEventListener(MouseEvent.CLICK,this.§1t5028s0§);
         this.bg.addChild(§1t406s0§.instance.§1t6523s0§);
      }
      
      internal function removeEventListeners() : *
      {
         this.§1t5017s0§.removeEventListener(MouseEvent.CLICK,this.§1t5026s0§);
         this.§1t5020s0§.removeEventListener(MouseEvent.CLICK,this.§1t5027s0§);
         this.§1t5019s0§.removeEventListener(MouseEvent.CLICK,this.§1t5028s0§);
      }
      
      internal function §1t5027s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         --this.page;
         this.§1t5025s0§();
      }
      
      internal function §1t5028s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         ++this.page;
         this.§1t5025s0§();
      }
   }
}


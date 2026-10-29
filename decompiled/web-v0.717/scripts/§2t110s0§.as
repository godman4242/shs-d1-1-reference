package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3305")]
   public class §2t110s0§ extends MovieClip
   {
      
      public var §1t5438s0§:§1t5488s0§;
      
      public var §1t6876s0§:§1t404s0§;
      
      public var §1t5971s0§:TextField;
      
      public var §1t5054s0§:TextField;
      
      public var §1t5056s0§:TextField;
      
      public var §1t5057s0§:TextField;
      
      public var §1t6881s0§:§1t404s0§;
      
      public var npcName:TextField;
      
      public var npcText:TextField;
      
      public var §2t122s0§:§1t404s0§;
      
      public var shopName:MovieClip;
      
      public function §2t110s0§()
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         super();
         _loc1_ = §1t407s0§.instance.x + 10;
         _loc2_ = §1t407s0§.instance.y + 40;
         var _loc3_:Number = §1t407s0§.instance.actionButtonHeight;
         this.§1t6876s0§.§1t5769s0§(§1t1521s0§.getString(83));
         this.§1t6876s0§.§1t5767s0§(§1t407s0§.§1t12447s0§);
         this.§1t6876s0§.x = _loc1_;
         this.§1t6876s0§.y = _loc2_;
         this.§2t122s0§.§1t5769s0§(§1t1521s0§.getString(84));
         this.§2t122s0§.§1t5767s0§(§1t407s0§.§1t12448s0§);
         this.§2t122s0§.x = _loc1_;
         this.§2t122s0§.y = _loc2_ + _loc3_;
         this.§1t6881s0§.§1t5769s0§(§1t1521s0§.getString(85));
         this.§1t6881s0§.§1t5767s0§(§1t407s0§.§1t12446s0§);
         this.§1t6881s0§.x = _loc1_;
         this.§1t6881s0§.y = _loc2_ + 2 * _loc3_;
         §1t1521s0§.§1t9290s0§(this.shopName.label,true);
         §1t1521s0§.§1t9290s0§(this.npcName,true);
         §1t1521s0§.§1t9290s0§(this.npcText);
         §1t1521s0§.§1t9290s0§(this.§1t5971s0§,true);
         this.§1t5971s0§.text = §1t1521s0§.getString(63);
         §1t1521s0§.§1t9290s0§(this.§1t5056s0§,true);
         this.§1t5056s0§.text = §1t1521s0§.getString(64);
      }
      
      public function updateNodeName(param1:String) : *
      {
         this.shopName.label.text = param1;
      }
      
      public function §1t8010s0§(param1:§1t73s0§) : *
      {
         this.§1t6876s0§.addEventListener(MouseEvent.CLICK,this.§1t5363s0§);
         this.§2t122s0§.addEventListener(MouseEvent.CLICK,this.§1t6897s0§);
         this.§1t6881s0§.addEventListener(MouseEvent.CLICK,this.§1t5026s0§);
         §1t407s0§.instance.visible = false;
         this.visible = true;
         this.§1t5438s0§.§1t5489s0§(param1.npcID);
         this.§1t5438s0§.§1t5492s0§();
         this.npcText.text = §1t1521s0§.getString(param1.§1t836s0§);
         this.npcName.text = §1t1524s0§.§1t1582s0§(param1.npcID);
         this.§1t5054s0§.text = §1t1523s0§.§1t9714s0§(11).toString();
         this.§1t5057s0§.text = §1t1523s0§.§1t9714s0§(12).toString();
         this.shopName.label.text = §1t1521s0§.getString(param1.name);
         §1t406s0§.instance.§1t6590s0§(false);
         §1t6427s0§.§1t8196s0§(false);
         if(!§1t1540s0§.§1t10014s0§())
         {
            §1t1541s0§.§1t10099s0§();
            §1t1523s0§.§1t9586s0§().§1t4453s0§();
         }
      }
      
      public function §1t5363s0§(param1:MouseEvent) : void
      {
         this.visible = false;
         §1t406s0§.instance.§1t6518s0§.§1t6890s0§(§1t1524s0§.§1t1183s0§(§1t1525s0§.§1t9935s0§()));
      }
      
      public function §1t6897s0§(param1:MouseEvent) : void
      {
         this.visible = false;
         §1t406s0§.instance.§1t6518s0§.§1t6892s0§(§1t1524s0§.§1t1183s0§(§1t1525s0§.§1t9935s0§()));
      }
      
      public function §1t5026s0§(param1:MouseEvent) : void
      {
         this.visible = false;
         §1t406s0§.instance.§1t6590s0§(true);
         §1t407s0§.instance.visible = true;
         this.§1t6876s0§.removeEventListener(MouseEvent.CLICK,this.§1t5363s0§);
         this.§2t122s0§.removeEventListener(MouseEvent.CLICK,this.§1t6897s0§);
         this.§1t6881s0§.removeEventListener(MouseEvent.CLICK,this.§1t5026s0§);
         §1t6427s0§.§1t8196s0§(true);
         if(!§1t1540s0§.§1t10014s0§())
         {
            §1t406s0§.instance.§1t6610s0§();
            §1t1541s0§.§1t10045s0§();
         }
      }
   }
}


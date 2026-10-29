package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   import playerio.§1t23s0§;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol912")]
   public class §1t6485s0§ extends MovieClip
   {
      
      public var bg:§1t5016s0§;
      
      public var §1t5293s0§:§1t395s0§;
      
      public var §1t6881s0§:SimpleButton;
      
      public var listingsUI:§1t7144s0§;
      
      public var loading:MovieClip;
      
      public function §1t6485s0§()
      {
         super();
      }
      
      public function §1t5004s0§() : *
      {
         this.§1t6881s0§.addEventListener(MouseEvent.CLICK,this.§1t5026s0§);
         this.bg.addChild(§1t406s0§.instance.§1t6523s0§);
      }
      
      public function removeEventListeners() : *
      {
         this.§1t6881s0§.removeEventListener(MouseEvent.CLICK,this.§1t5026s0§);
      }
      
      public function §1t5026s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_back");
         if(this.§1t5293s0§.visible)
         {
            this.listingsUI.§1t7161s0§();
            this.§1t5293s0§.hide();
         }
         else
         {
            this.hide();
         }
      }
      
      public function show() : *
      {
         this.§1t5004s0§();
         visible = true;
         this.§1t5293s0§.visible = false;
         if(§1t1540s0§.§1t9550s0§())
         {
            §1t251s0§.instance.§1t3532s0§(true);
         }
         this.listingsUI.show();
      }
      
      public function hide() : *
      {
         this.§1t5293s0§.hide();
         this.listingsUI.hide();
         this.listingsUI.§1t7176s0§();
         this.removeEventListeners();
         if(§1t1540s0§.§1t10014s0§())
         {
            §1t6427s0§.§1t12473s0§(true);
         }
         else
         {
            §1t1541s0§.§1t10045s0§();
            §1t251s0§.instance.§1t3532s0§(false);
         }
         visible = false;
         §1t406s0§.instance.§1t6614s0§();
      }
      
      public function §1t7178s0§(param1:String, param2:§1t23s0§ = null) : *
      {
         this.§1t5004s0§();
         this.visible = true;
         this.listingsUI.visible = false;
         if(§1t1540s0§.§1t9550s0§())
         {
            §1t251s0§.instance.§1t3532s0§(true);
         }
         this.§1t5293s0§.show(param1,param2);
      }
      
      public function update() : *
      {
         if(!visible)
         {
            return;
         }
         this.§1t5293s0§.update();
      }
      
      public function §1t7179s0§() : *
      {
         this.bg.addChild(§1t406s0§.instance.§1t6523s0§);
         this.listingsUI.goldtext.text = §1t1523s0§.§1t9714s0§(20112).toString();
         this.§1t5293s0§.goldtext.text = §1t1523s0§.§1t9714s0§(20112).toString();
      }
   }
}


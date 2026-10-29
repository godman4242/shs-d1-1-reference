package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol738")]
   public class §1t7790s0§ extends MovieClip
   {
      
      public var §1t6757s0§:§1t5070s0§;
      
      public var buildlabel1:TextField;
      
      public var buildlabel2:TextField;
      
      public var buildlabel3:TextField;
      
      public var desctext1:TextField;
      
      public var desctext2:TextField;
      
      public var desctext3:TextField;
      
      public var hex1:§1t416s0§;
      
      public var hex2:§1t416s0§;
      
      public var hex3:§1t416s0§;
      
      public var §1t5019s0§:§1t4912s0§;
      
      public var §1t5020s0§:§1t4912s0§;
      
      public var titlelabel:TextField;
      
      internal var §1t7805s0§:Array = new Array();
      
      internal var §1t7888s0§:Array = new Array();
      
      internal var §1t7889s0§:Array = new Array();
      
      public function §1t7790s0§()
      {
         super();
         §1t1521s0§.§1t9290s0§(this.titlelabel,true);
         §1t1521s0§.§1t9290s0§(this.buildlabel1);
         §1t1521s0§.§1t9290s0§(this.buildlabel2);
         §1t1521s0§.§1t9290s0§(this.buildlabel3);
         §1t1521s0§.§1t9290s0§(this.desctext1);
         §1t1521s0§.§1t9290s0§(this.desctext2);
         §1t1521s0§.§1t9290s0§(this.desctext3);
         this.§1t7805s0§.push(this.hex1);
         this.§1t7805s0§.push(this.hex2);
         this.§1t7805s0§.push(this.hex3);
         this.§1t7888s0§.push(this.buildlabel1);
         this.§1t7888s0§.push(this.buildlabel2);
         this.§1t7888s0§.push(this.buildlabel3);
         this.§1t7889s0§.push(this.desctext1);
         this.§1t7889s0§.push(this.desctext2);
         this.§1t7889s0§.push(this.desctext3);
         this.buildlabel1.mouseEnabled = false;
         this.buildlabel2.mouseEnabled = false;
         this.buildlabel3.mouseEnabled = false;
         this.titlelabel.text = §1t1521s0§.getString(565);
         this.buildlabel1.text = §1t1521s0§.getString(422);
         this.buildlabel2.text = §1t1521s0§.getString(422);
         this.buildlabel3.text = §1t1521s0§.getString(422);
         this.§1t5224s0§();
         this.§1t5020s0§.visible = false;
         this.§1t5019s0§.visible = false;
         this.§1t6757s0§.§1t5769s0§(§1t1521s0§.getString(9));
      }
      
      internal function §1t5224s0§() : *
      {
         this.§1t7890s0§(0,false);
         this.§1t7890s0§(1,false);
         this.§1t7890s0§(2,false);
      }
      
      public function show(param1:§1t416s0§) : *
      {
         if(!visible)
         {
            §1t88s0§.instance.§1t1516s0§("Snd_click");
            visible = true;
            this.§1t5004s0§();
            this.§1t5224s0§();
            if(param1.hextype == §1t416s0§.§1t12524s0§)
            {
               this.§1t7890s0§(0,true);
               this.§1t7805s0§[0].§1t7765s0§(param1.owner);
               this.§1t7805s0§[0].§1t7770s0§(§1t416s0§.§1t12520s0§);
               this.§1t7805s0§[0].§1t7773s0§();
               this.§1t7889s0§[0].text = this.§1t514s0§(§1t416s0§.§1t12520s0§);
            }
            else if(param1.hextype == §1t416s0§.§1t12519s0§)
            {
               this.§1t7890s0§(0,true);
               this.§1t7805s0§[0].§1t7765s0§(param1.owner);
               this.§1t7805s0§[0].§1t7770s0§(§1t416s0§.§1t12521s0§);
               this.§1t7805s0§[0].§1t7773s0§();
               this.§1t7889s0§[0].text = this.§1t514s0§(§1t416s0§.§1t12521s0§);
               this.§1t7890s0§(1,true);
               this.§1t7805s0§[1].§1t7765s0§(param1.owner);
               this.§1t7805s0§[1].§1t7770s0§(§1t416s0§.§1t12527s0§);
               this.§1t7805s0§[1].§1t7773s0§();
               this.§1t7889s0§[1].text = this.§1t514s0§(§1t416s0§.§1t12527s0§);
               this.§1t7890s0§(2,true);
               this.§1t7805s0§[2].§1t7765s0§(param1.owner);
               this.§1t7805s0§[2].§1t7770s0§(§1t416s0§.§1t12526s0§);
               this.§1t7805s0§[2].§1t7773s0§();
               this.§1t7889s0§[2].text = this.§1t514s0§(§1t416s0§.§1t12526s0§);
            }
            else if(param1.hextype == §1t416s0§.§1t12528s0§)
            {
               this.§1t7890s0§(0,true);
               this.§1t7805s0§[0].§1t7765s0§(param1.owner);
               this.§1t7805s0§[0].§1t7770s0§(§1t416s0§.§1t12523s0§);
               this.§1t7805s0§[0].§1t7773s0§();
               this.§1t7889s0§[0].text = this.§1t514s0§(§1t416s0§.§1t12523s0§);
            }
         }
      }
      
      public function hide() : *
      {
         if(visible)
         {
            visible = false;
            this.removeEventListeners();
         }
      }
      
      internal function §1t6769s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_back");
         this.hide();
      }
      
      internal function §1t7890s0§(param1:int, param2:Boolean) : *
      {
         this.§1t7888s0§[param1].visible = param2;
         this.§1t7805s0§[param1].visible = param2;
         this.§1t7889s0§[param1].visible = param2;
      }
      
      public function §1t5004s0§() : *
      {
         this.hex1.addEventListener(MouseEvent.CLICK,this.§1t7891s0§);
         this.hex2.addEventListener(MouseEvent.CLICK,this.§1t7892s0§);
         this.hex3.addEventListener(MouseEvent.CLICK,this.§1t7893s0§);
         this.§1t6757s0§.§1t5004s0§();
         this.§1t6757s0§.addEventListener(MouseEvent.CLICK,this.§1t6769s0§);
      }
      
      public function removeEventListeners() : *
      {
         this.hex1.removeEventListener(MouseEvent.CLICK,this.§1t7891s0§);
         this.hex2.removeEventListener(MouseEvent.CLICK,this.§1t7892s0§);
         this.hex3.removeEventListener(MouseEvent.CLICK,this.§1t7893s0§);
         this.§1t6757s0§.removeEventListeners();
         this.§1t6757s0§.removeEventListener(MouseEvent.CLICK,this.§1t6769s0§);
      }
      
      internal function §1t7891s0§(param1:MouseEvent) : *
      {
         this.§1t7894s0§(0);
      }
      
      internal function §1t7892s0§(param1:MouseEvent) : *
      {
         this.§1t7894s0§(1);
      }
      
      internal function §1t7893s0§(param1:MouseEvent) : *
      {
         this.§1t7894s0§(2);
      }
      
      internal function §1t7894s0§(param1:int) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_click");
         §1t406s0§.instance.§1t6482s0§.§1t8003s0§.§1t1927s0§(this.§1t7805s0§[param1].hextype);
      }
      
      internal function §1t514s0§(param1:int) : String
      {
         var _loc2_:String = "";
         switch(param1)
         {
            case §1t416s0§.§1t12521s0§:
               _loc2_ = §1t1521s0§.getString(350) + "\n";
               _loc2_ += "- " + §1t1521s0§.getString(566) + 10000 + " " + §1t1521s0§.getString(63) + "\n";
               _loc2_ += "- " + §1t1521s0§.getString(567);
               break;
            case §1t416s0§.§1t12526s0§:
               _loc2_ = §1t1521s0§.getString(568) + "\n";
               _loc2_ += "- " + §1t1521s0§.getString(566) + 5000 + " " + §1t1521s0§.getString(63) + "\n";
               _loc2_ += "- " + §1t1521s0§.getString(569);
               break;
            case §1t416s0§.§1t12527s0§:
               _loc2_ = §1t1521s0§.getString(570) + "\n";
               _loc2_ += "- " + §1t1521s0§.getString(566) + 10000 + " " + §1t1521s0§.getString(63) + "\n";
               _loc2_ += "- " + §1t1521s0§.getString(571);
               break;
            case §1t416s0§.§1t12523s0§:
               _loc2_ = §1t1521s0§.getString(572) + "\n";
               _loc2_ += "- " + §1t1521s0§.getString(566) + 10000 + " " + §1t1521s0§.getString(63) + "\n";
               _loc2_ += "- " + §1t1521s0§.getString(573);
               break;
            case §1t416s0§.§1t12520s0§:
               _loc2_ = §1t1521s0§.getString(349) + "\n";
               _loc2_ += "- " + §1t1521s0§.getString(574);
         }
         return _loc2_;
      }
   }
}


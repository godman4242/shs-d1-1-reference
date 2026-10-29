package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1736")]
   public class §1t5551s0§ extends MovieClip
   {
      
      public var §1t5017s0§:§1t5003s0§;
      
      public var leaderboardtype:TextField;
      
      public var §1t5381s0§:TextField;
      
      public var nextButton:§1t5070s0§;
      
      public var prevButton:§1t5070s0§;
      
      public var ranklabel:TextField;
      
      public var typeButton:§1t5070s0§;
      
      public var winlosslabel:TextField;
      
      internal var page:int = 0;
      
      internal var slots:Vector.<§1t5542s0§>;
      
      internal var §1t5023s0§:int = 10;
      
      internal var loading:MovieClip;
      
      internal var §1t5558s0§:Boolean = true;
      
      public function §1t5551s0§()
      {
         var _loc2_:§1t5542s0§ = null;
         this.slots = new Vector.<§1t5542s0§>();
         super();
         var _loc1_:int = 0;
         while(_loc1_ < this.§1t5023s0§)
         {
            _loc2_ = new §1t5542s0§();
            this.slots.push(_loc2_);
            addChild(_loc2_);
            _loc2_.x = 147;
            _loc2_.y = 113 + _loc1_ * 32;
            _loc2_.visible = false;
            _loc1_++;
         }
         this.nextButton.§1t5769s0§(§1t1521s0§.getString(150));
         this.prevButton.§1t5769s0§(§1t1521s0§.getString(151));
         this.§1t5017s0§.§1t5769s0§(§1t1521s0§.getString(173));
         this.typeButton.§1t5769s0§(§1t1521s0§.getString(415));
         §1t1521s0§.§1t9290s0§(this.leaderboardtype,true);
         this.leaderboardtype.text = §1t1521s0§.getString(418);
         §1t1521s0§.§1t9290s0§(this.ranklabel,true);
         this.ranklabel.text = §1t1521s0§.getString(153);
         §1t1521s0§.§1t9290s0§(this.§1t5381s0§,true);
         this.§1t5381s0§.text = §1t1521s0§.getString(154);
         §1t1521s0§.§1t9290s0§(this.winlosslabel,true);
         this.winlosslabel.text = §1t1521s0§.getString(152);
      }
      
      public function show(param1:MovieClip) : *
      {
         this.§1t5004s0§();
         this.page = 0;
         this.visible = true;
         this.prevButton.visible = false;
         this.nextButton.visible = false;
         this.loading = param1;
         this.§1t5559s0§();
      }
      
      internal function §1t5559s0§() : *
      {
         this.loading.visible = true;
         this.§1t5561s0§();
         §1t3317s0§.instance.§1t1884s0§(this.page,this.§1t5558s0§);
         this.prevButton.visible = this.page != 0;
      }
      
      public function §1t5560s0§(param1:String) : *
      {
         var _loc4_:Array = null;
         var _loc2_:Array = param1.split("^");
         var _loc3_:* = _loc2_.length;
         if(_loc2_[_loc3_ - 1] == "")
         {
            _loc3_--;
         }
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            _loc4_ = _loc2_[_loc5_].split("#");
            this.slots[_loc5_].§1t5548s0§(_loc4_[0],_loc4_[1],_loc4_[2],_loc4_[3],_loc4_[4],_loc4_[5]);
            this.slots[_loc5_].§1t5549s0§(this.page * this.§1t5023s0§ + _loc5_ + 1);
            this.slots[_loc5_].§1t5550s0§(_loc4_[0] == §1t1523s0§.charname);
            this.slots[_loc5_].visible = true;
            _loc5_++;
         }
         this.loading.visible = false;
         this.nextButton.visible = this.slots[this.§1t5023s0§ - 1].visible;
      }
      
      internal function §1t5561s0§() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.§1t5023s0§)
         {
            this.slots[_loc1_].visible = false;
            _loc1_++;
         }
      }
      
      public function §1t5026s0§(param1:MouseEvent) : void
      {
         this.removeEventListeners();
         visible = false;
         §1t5565s0§.instance.§1t5606s0§();
         this.loading = null;
      }
      
      internal function §1t5004s0§() : *
      {
         this.§1t5017s0§.addEventListener(MouseEvent.CLICK,this.§1t5026s0§);
         this.nextButton.addEventListener(MouseEvent.CLICK,this.§1t5562s0§);
         this.prevButton.addEventListener(MouseEvent.CLICK,this.§1t5563s0§);
         this.typeButton.addEventListener(MouseEvent.CLICK,this.§1t5564s0§);
         this.nextButton.§1t5004s0§();
         this.prevButton.§1t5004s0§();
         this.typeButton.§1t5004s0§();
         this.§1t5017s0§.§1t5004s0§();
      }
      
      internal function removeEventListeners() : *
      {
         this.§1t5017s0§.removeEventListener(MouseEvent.CLICK,this.§1t5026s0§);
         this.nextButton.removeEventListener(MouseEvent.CLICK,this.§1t5562s0§);
         this.prevButton.removeEventListener(MouseEvent.CLICK,this.§1t5563s0§);
         this.typeButton.removeEventListener(MouseEvent.CLICK,this.§1t5564s0§);
         this.nextButton.removeEventListeners();
         this.prevButton.removeEventListeners();
         this.typeButton.removeEventListeners();
         this.§1t5017s0§.removeEventListeners();
      }
      
      internal function §1t5562s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         this.page += 1;
         this.§1t5559s0§();
      }
      
      internal function §1t5563s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         if(this.page != 0)
         {
            --this.page;
            this.§1t5559s0§();
         }
      }
      
      internal function §1t5564s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         this.§1t5558s0§ = !this.§1t5558s0§;
         this.page = 0;
         if(this.§1t5558s0§)
         {
            this.typeButton.§1t5769s0§(§1t1521s0§.getString(415));
            this.leaderboardtype.text = §1t1521s0§.getString(418);
         }
         else
         {
            this.typeButton.§1t5769s0§(§1t1521s0§.getString(416));
            this.leaderboardtype.text = §1t1521s0§.getString(417);
         }
         this.§1t5559s0§();
      }
   }
}


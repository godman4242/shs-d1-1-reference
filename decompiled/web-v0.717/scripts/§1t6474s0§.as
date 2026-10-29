package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol955")]
   public class §1t6474s0§ extends MovieClip
   {
      
      public var bg:§1t5016s0§;
      
      public var cat1:§1t6907s0§;
      
      public var cat10:§1t6907s0§;
      
      public var cat2:§1t6907s0§;
      
      public var cat3:§1t6907s0§;
      
      public var cat4:§1t6907s0§;
      
      public var cat5:§1t6907s0§;
      
      public var cat6:§1t6907s0§;
      
      public var cat7:§1t6907s0§;
      
      public var cat8:§1t6907s0§;
      
      public var cat9:§1t6907s0§;
      
      public var §1t6917s0§:§1t5050s0§;
      
      public var categorylabel:TextField;
      
      public var §1t5017s0§:SimpleButton;
      
      public var displayslot:§1t6907s0§;
      
      public var §1t5052s0§:§1t6907s0§;
      
      public var §1t6920s0§:MovieClip;
      
      public var §1t6921s0§:§1t5050s0§;
      
      public var equippedlabel:TextField;
      
      public var §1t6923s0§:TextField;
      
      public var skilldesc:TextField;
      
      public var skillpointsLabel:TextField;
      
      public var §1t5021s0§:TextField;
      
      public var §1t6926s0§:§1t5050s0§;
      
      internal var §1t6927s0§:int = 32;
      
      internal var §1t6928s0§:Vector.<§1t6907s0§>;
      
      internal var §1t6929s0§:int = 8;
      
      internal var §1t6012s0§:Vector.<§1t6907s0§>;
      
      internal var §1t5098s0§:int = 328;
      
      internal var §1t5099s0§:int = 135;
      
      internal var §1t5100s0§:int = 57;
      
      internal var §1t5101s0§:int = 60;
      
      internal var §1t5183s0§:§1t6907s0§ = null;
      
      internal var §1t6930s0§:§1t6907s0§ = null;
      
      internal var §1t6931s0§:Boolean;
      
      internal var §1t6932s0§:int = 0;
      
      internal var §1t6933s0§:int = 10;
      
      internal var §1t6934s0§:Vector.<§1t6907s0§>;
      
      internal var §1t6935s0§:Array;
      
      internal var §1t6936s0§:Array;
      
      internal var §1t5134s0§:Boolean;
      
      internal var §1t5135s0§:Boolean;
      
      public function §1t6474s0§()
      {
         var _loc1_:§1t6907s0§ = null;
         var _loc2_:int = 0;
         this.§1t6928s0§ = new Vector.<§1t6907s0§>(this.§1t6927s0§);
         this.§1t6012s0§ = new Vector.<§1t6907s0§>(this.§1t6929s0§);
         this.§1t6934s0§ = new Vector.<§1t6907s0§>();
         this.§1t6935s0§ = [1,2,3,4,5,6,7,8,9,10];
         this.§1t6936s0§ = [6024,6025,6026,6027,6028,6029,6030,6031,6032,6033];
         super();
         _loc2_ = 0;
         while(_loc2_ < this.§1t6927s0§)
         {
            _loc1_ = new §1t6907s0§();
            addChild(_loc1_);
            this.§1t6928s0§[_loc2_] = _loc1_;
            _loc1_.x = this.§1t5098s0§ + _loc2_ % 8 * this.§1t5100s0§;
            _loc1_.y = this.§1t5099s0§ + Math.floor(_loc2_ / 8) * this.§1t5101s0§;
            _loc1_.visible = false;
            _loc1_.doubleClickEnabled = true;
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < this.§1t6929s0§)
         {
            _loc1_ = new §1t6907s0§();
            addChild(_loc1_);
            this.§1t6012s0§[_loc2_] = _loc1_;
            _loc1_.x = 727 - _loc2_ * this.§1t5100s0§;
            _loc1_.y = 430;
            _loc1_.visible = true;
            _loc1_.doubleClickEnabled = true;
            _loc2_++;
         }
         this.cat1.§1t6966s0§(this.§1t6935s0§[0],1);
         this.cat2.§1t6966s0§(this.§1t6935s0§[1],1);
         this.cat3.§1t6966s0§(this.§1t6935s0§[2],1);
         this.cat4.§1t6966s0§(this.§1t6935s0§[3],1);
         this.cat5.§1t6966s0§(this.§1t6935s0§[4],1);
         this.cat6.§1t6966s0§(this.§1t6935s0§[5],1);
         this.cat7.§1t6966s0§(this.§1t6935s0§[6],1);
         this.cat8.§1t6966s0§(this.§1t6935s0§[7],1);
         this.cat9.§1t6966s0§(this.§1t6935s0§[8],1);
         this.cat10.§1t6966s0§(this.§1t6935s0§[9],1);
         this.§1t6934s0§.push(this.cat1);
         this.§1t6934s0§.push(this.cat2);
         this.§1t6934s0§.push(this.cat3);
         this.§1t6934s0§.push(this.cat4);
         this.§1t6934s0§.push(this.cat5);
         this.§1t6934s0§.push(this.cat6);
         this.§1t6934s0§.push(this.cat7);
         this.§1t6934s0§.push(this.cat8);
         this.§1t6934s0§.push(this.cat9);
         this.§1t6934s0§.push(this.cat10);
         this.§1t6926s0§.§1t5769s0§(§1t1521s0§.getString(80));
         this.§1t6926s0§.visible = false;
         this.§1t6921s0§.§1t5769s0§(§1t1521s0§.getString(298));
         this.§1t6921s0§.visible = false;
         this.§1t6917s0§.§1t5769s0§(§1t1521s0§.getString(686));
         this.§1t6917s0§.visible = false;
         this.displayslot.mouseEnabled = false;
         this.§1t5052s0§.mouseEnabled = false;
         this.§1t5052s0§.visible = false;
         this.§1t5021s0§.text = §1t1521s0§.getString(81);
         §1t1521s0§.§1t9290s0§(this.skilldesc,true);
         §1t1521s0§.§1t9290s0§(this.equippedlabel,true);
         this.equippedlabel.text = §1t1521s0§.getString(297);
         §1t1521s0§.§1t9290s0§(this.skillpointsLabel,true);
         §1t1521s0§.§1t9290s0§(this.categorylabel,true);
         this.categorylabel.text = §1t1521s0§.getString(989);
         §1t1521s0§.§1t9290s0§(this.§1t5021s0§,true);
         §1t1521s0§.§1t9290s0§(this.§1t6923s0§,true);
         §1t1521s0§.§1t9290s0§(this.§1t6920s0§.atklabel,true);
         this.§1t6920s0§.atklabel.text = §1t1521s0§.getString(224);
         setChildIndex(this.§1t5052s0§,numChildren - 1);
      }
      
      internal function §1t6937s0§() : *
      {
         this.skillpointsLabel.text = §1t1521s0§.getString(82) + String(§1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9418s0§));
      }
      
      internal function §1t6938s0§(param1:int, param2:Boolean = false) : *
      {
         var _loc4_:int = 0;
         var _loc3_:§1t105s0§ = §1t1524s0§.§1t9863s0§(param1);
         if(_loc3_ == null)
         {
            return;
         }
         this.§1t6953s0§(false);
         _loc4_ = §1t1523s0§.§1t9714s0§(param1);
         this.skilldesc.htmlText = _loc3_.§1t1461s0§(_loc4_);
         this.§1t6923s0§.htmlText = _loc3_.§1t1462s0§(_loc4_);
         this.§1t6923s0§.visible = true;
         this.displayslot.§1t6966s0§(param1,_loc4_);
         this.§1t5052s0§.§1t6966s0§(param1,_loc4_);
         if(_loc3_.§1t1467s0§())
         {
            this.§1t6926s0§.visible = true;
            this.§1t6926s0§.§1t5769s0§(§1t1521s0§.getString(299));
         }
         else if(_loc3_.§1t1468s0§())
         {
            this.§1t6926s0§.visible = true;
            this.§1t6926s0§.§1t5769s0§(§1t1521s0§.getString(80));
         }
         else
         {
            this.§1t6926s0§.visible = false;
            if(!_loc3_.§1t1469s0§())
            {
               this.§1t6923s0§.visible = false;
            }
         }
         if(!param2 && _loc3_.§1t1470s0§())
         {
            this.§1t6921s0§.visible = true;
            this.§1t6921s0§.§1t5769s0§(§1t1521s0§.getString(298));
            this.§1t6931s0§ = false;
         }
         else if(param2)
         {
            this.§1t6921s0§.visible = true;
            this.§1t6921s0§.§1t5769s0§(§1t1521s0§.getString(300));
            this.§1t6931s0§ = true;
         }
         else
         {
            this.§1t6921s0§.visible = false;
         }
      }
      
      internal function §1t6939s0§(param1:MouseEvent) : *
      {
         if(this.§1t6930s0§ != null)
         {
            this.§1t6930s0§.§1t6786s0§(false);
         }
         this.§1t6930s0§ = null;
         var _loc2_:int = int(param1.target.§1t6963s0§());
         if(this.§1t5183s0§ != null)
         {
            this.§1t5183s0§.§1t6786s0§(false);
         }
         this.§1t5183s0§ = param1.target as §1t6907s0§;
         this.§1t5183s0§.§1t6786s0§(true);
         this.§1t6938s0§(param1.target.§1t6963s0§(),this.§1t6949s0§(_loc2_));
      }
      
      internal function §1t6940s0§(param1:MouseEvent) : *
      {
         if(this.§1t5183s0§ != null)
         {
            this.§1t5183s0§.§1t6786s0§(false);
         }
         this.§1t5183s0§ = null;
         var _loc2_:int = int(param1.target.§1t6963s0§());
         if(_loc2_ == 0)
         {
            return;
         }
         if(this.§1t6930s0§ != null)
         {
            this.§1t6930s0§.§1t6786s0§(false);
         }
         this.§1t6930s0§ = param1.target as §1t6907s0§;
         this.§1t6930s0§.§1t6786s0§(true);
         this.§1t6938s0§(this.§1t6930s0§.§1t6963s0§(),this.§1t6949s0§(_loc2_));
      }
      
      internal function §1t6941s0§(param1:MouseEvent) : *
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.§1t6933s0§)
         {
            if(this.§1t6934s0§[_loc2_] == param1.target)
            {
               this.§1t6951s0§(_loc2_ + 1);
               return;
            }
            _loc2_++;
         }
      }
      
      internal function §1t6942s0§(param1:MouseEvent) : *
      {
         var _loc2_:int = 0;
         this.displayslot.visible = true;
         this.skilldesc.visible = true;
         var _loc3_:int = 0;
         while(_loc3_ < this.§1t6933s0§)
         {
            if(this.§1t6934s0§[_loc3_] == param1.target)
            {
               _loc2_ = _loc3_ + 1;
               break;
            }
            _loc3_++;
         }
         this.displayslot.§1t6966s0§(this.§1t6935s0§[_loc2_ - 1],1);
         this.skilldesc.htmlText = §1t1521s0§.getString(this.§1t6936s0§[_loc2_ - 1]);
      }
      
      internal function §1t6943s0§(param1:MouseEvent) : *
      {
         this.§1t6953s0§(true);
      }
      
      internal function §1t6944s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_upgradeSkill");
         §1t1523s0§.§1t9713s0§(§1t1523s0§.§1t9418s0§,-§1t1524s0§.§1t9863s0§(this.displayslot.§1t6963s0§()).§1t1464s0§(§1t1523s0§.§1t9714s0§(this.displayslot.§1t6963s0§())));
         §1t1523s0§.§1t9713s0§(this.displayslot.§1t6963s0§(),1);
         this.§1t6937s0§();
         this.§1t6938s0§(this.displayslot.§1t6963s0§());
         this.§1t6945s0§(this.displayslot.§1t6963s0§());
         this.§1t6954s0§();
      }
      
      internal function §1t6945s0§(param1:int) : *
      {
         var _loc3_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < this.§1t6927s0§)
         {
            if(this.§1t6928s0§[_loc2_].§1t6963s0§() == param1)
            {
               this.§1t6928s0§[_loc2_].§1t6966s0§(param1,§1t1523s0§.§1t9714s0§(param1));
               break;
            }
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < this.§1t6929s0§)
         {
            if(this.§1t6012s0§[_loc2_].§1t6963s0§() == param1)
            {
               _loc3_ = §1t1523s0§.§1t9714s0§(param1);
               this.§1t6012s0§[_loc2_].§1t6966s0§(param1,_loc3_);
               §1t1523s0§.§1t6928s0§[_loc2_].§1t762s0§(_loc3_);
               §1t3317s0§.instance.§1t1530s0§(§1t1523s0§.§1t9687s0§);
               break;
            }
            _loc2_++;
         }
      }
      
      internal function §1t6946s0§(param1:MouseEvent) : *
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:int = §1t1523s0§.§1t9602s0§() - 1;
         if(this.§1t6931s0§)
         {
            if(this.§1t6930s0§ != null)
            {
               _loc3_ = this.§1t6930s0§.§1t6963s0§();
            }
            else
            {
               _loc3_ = this.§1t5183s0§.§1t6963s0§();
            }
            _loc4_ = 0;
            while(_loc4_ <= _loc2_)
            {
               if(this.§1t6012s0§[_loc4_].§1t6963s0§() == _loc3_)
               {
                  _loc2_ = _loc4_;
                  break;
               }
               _loc4_++;
            }
            this.§1t6948s0§(_loc2_);
         }
         else
         {
            _loc4_ = 0;
            while(_loc4_ <= _loc2_)
            {
               if(this.§1t6012s0§[_loc4_].§1t6963s0§() == 0)
               {
                  _loc2_ = _loc4_;
                  break;
               }
               _loc4_++;
            }
            this.§1t6947s0§(this.§1t5183s0§.§1t6963s0§(),this.§1t5183s0§.§1t4491s0§(),_loc2_);
         }
      }
      
      internal function §1t6947s0§(param1:*, param2:*, param3:int) : *
      {
         if(§1t6495s0§.instance.§1t1028s0§() == 9)
         {
            §1t6495s0§.instance.§1t1023s0§(0);
         }
         var _loc4_:int = -1;
         var _loc5_:int = 0;
         while(_loc5_ < this.§1t6929s0§)
         {
            if(this.§1t6012s0§[_loc5_].§1t6963s0§() == param1)
            {
               _loc4_ = _loc5_;
               break;
            }
            _loc5_++;
         }
         if(_loc4_ != -1)
         {
            this.§1t6948s0§(_loc4_);
         }
         else
         {
            §1t88s0§.instance.§1t1516s0§("Snd_put");
         }
         if(this.§1t6930s0§ != null)
         {
            this.§1t6930s0§.§1t6786s0§(false);
         }
         this.§1t6930s0§ = this.§1t6012s0§[param3];
         this.§1t6930s0§.§1t6786s0§(true);
         if(this.§1t5183s0§ != null)
         {
            this.§1t5183s0§.§1t6786s0§(false);
         }
         this.§1t5183s0§ = null;
         §1t1523s0§.§1t6928s0§[param3] = new §1t57s0§(param1,param2);
         this.§1t6954s0§();
         this.§1t6938s0§(param1,true);
         §1t3317s0§.instance.§1t1530s0§(§1t1523s0§.§1t9687s0§);
      }
      
      internal function §1t6948s0§(param1:int) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_put");
         §1t1523s0§.§1t6928s0§[param1] = new §1t57s0§(0,0);
         this.§1t6954s0§();
         §1t3317s0§.instance.§1t1530s0§(§1t1523s0§.§1t9687s0§);
         if(this.§1t6930s0§ != null)
         {
            this.§1t6930s0§.§1t6786s0§(false);
         }
         this.§1t6930s0§ = null;
         if(this.§1t5183s0§ != null)
         {
            this.§1t5183s0§.§1t6786s0§(false);
         }
         this.§1t5183s0§ = null;
         this.§1t6921s0§.visible = false;
         this.§1t6953s0§(true);
      }
      
      internal function §1t6949s0§(param1:int) : *
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.§1t6929s0§)
         {
            if(this.§1t6012s0§[_loc2_].§1t6963s0§() == param1)
            {
               return true;
            }
            _loc2_++;
         }
         return false;
      }
      
      internal function §1t5004s0§() : *
      {
         this.§1t5017s0§.addEventListener(MouseEvent.CLICK,this.§1t5026s0§);
         this.§1t6926s0§.§1t5004s0§();
         this.§1t6926s0§.addEventListener(MouseEvent.CLICK,this.§1t6944s0§);
         this.§1t6921s0§.§1t5004s0§();
         this.§1t6921s0§.addEventListener(MouseEvent.CLICK,this.§1t6946s0§);
         this.§1t6917s0§.§1t5004s0§();
         this.§1t6917s0§.addEventListener(MouseEvent.CLICK,this.§1t6957s0§);
         var _loc1_:int = 0;
         while(_loc1_ < this.§1t6927s0§)
         {
            this.§1t6928s0§[_loc1_].addEventListener(MouseEvent.CLICK,this.§1t6939s0§);
            this.§1t6928s0§[_loc1_].addEventListener(MouseEvent.DOUBLE_CLICK,this.§1t6956s0§);
            this.§1t6928s0§[_loc1_].addEventListener(MouseEvent.MOUSE_DOWN,this.§1t5136s0§);
            this.§1t6928s0§[_loc1_].addEventListener(MouseEvent.MOUSE_MOVE,this.§1t5137s0§);
            this.§1t6928s0§[_loc1_].§1t6964s0§();
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < this.§1t6929s0§)
         {
            this.§1t6012s0§[_loc1_].addEventListener(MouseEvent.CLICK,this.§1t6940s0§);
            this.§1t6012s0§[_loc1_].addEventListener(MouseEvent.DOUBLE_CLICK,this.§1t6956s0§);
            this.§1t6012s0§[_loc1_].addEventListener(MouseEvent.MOUSE_DOWN,this.§1t5136s0§);
            this.§1t6012s0§[_loc1_].addEventListener(MouseEvent.MOUSE_MOVE,this.§1t5137s0§);
            this.§1t6012s0§[_loc1_].§1t6964s0§();
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < this.§1t6933s0§)
         {
            this.§1t6934s0§[_loc1_].addEventListener(MouseEvent.CLICK,this.§1t6941s0§);
            this.§1t6934s0§[_loc1_].addEventListener(MouseEvent.ROLL_OVER,this.§1t6942s0§);
            this.§1t6934s0§[_loc1_].addEventListener(MouseEvent.ROLL_OUT,this.§1t6943s0§);
            this.§1t6934s0§[_loc1_].§1t6964s0§();
            _loc1_++;
         }
         addEventListener(MouseEvent.MOUSE_UP,this.§1t5138s0§);
         this.§1t5052s0§.addEventListener(MouseEvent.MOUSE_UP,this.§1t5138s0§);
         this.bg.addEventListener(MouseEvent.CLICK,this.§1t6955s0§);
         this.bg.addChild(§1t406s0§.instance.§1t6523s0§);
      }
      
      internal function removeEventListeners() : *
      {
         this.§1t5017s0§.removeEventListener(MouseEvent.CLICK,this.§1t5026s0§);
         this.§1t6926s0§.removeEventListeners();
         this.§1t6926s0§.removeEventListener(MouseEvent.CLICK,this.§1t6944s0§);
         this.§1t6921s0§.removeEventListeners();
         this.§1t6921s0§.removeEventListener(MouseEvent.CLICK,this.§1t6946s0§);
         this.§1t6917s0§.removeEventListeners();
         this.§1t6917s0§.removeEventListener(MouseEvent.CLICK,this.§1t6957s0§);
         var _loc1_:int = 0;
         while(_loc1_ < this.§1t6927s0§)
         {
            this.§1t6928s0§[_loc1_].removeEventListener(MouseEvent.CLICK,this.§1t6939s0§);
            this.§1t6928s0§[_loc1_].removeEventListener(MouseEvent.DOUBLE_CLICK,this.§1t6956s0§);
            this.§1t6928s0§[_loc1_].removeEventListener(MouseEvent.MOUSE_DOWN,this.§1t5136s0§);
            this.§1t6928s0§[_loc1_].removeEventListener(MouseEvent.MOUSE_MOVE,this.§1t5137s0§);
            this.§1t6928s0§[_loc1_].§1t6965s0§();
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < this.§1t6929s0§)
         {
            this.§1t6012s0§[_loc1_].removeEventListener(MouseEvent.CLICK,this.§1t6940s0§);
            this.§1t6012s0§[_loc1_].removeEventListener(MouseEvent.DOUBLE_CLICK,this.§1t6956s0§);
            this.§1t6012s0§[_loc1_].removeEventListener(MouseEvent.MOUSE_DOWN,this.§1t5136s0§);
            this.§1t6012s0§[_loc1_].removeEventListener(MouseEvent.MOUSE_MOVE,this.§1t5137s0§);
            this.§1t6012s0§[_loc1_].§1t6965s0§();
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < this.§1t6933s0§)
         {
            this.§1t6934s0§[_loc1_].removeEventListener(MouseEvent.CLICK,this.§1t6941s0§);
            this.§1t6934s0§[_loc1_].removeEventListener(MouseEvent.ROLL_OVER,this.§1t6942s0§);
            this.§1t6934s0§[_loc1_].removeEventListener(MouseEvent.ROLL_OUT,this.§1t6943s0§);
            this.§1t6934s0§[_loc1_].§1t6965s0§();
            _loc1_++;
         }
         removeEventListener(MouseEvent.MOUSE_UP,this.§1t5138s0§);
         this.§1t5052s0§.removeEventListener(MouseEvent.MOUSE_UP,this.§1t5138s0§);
         this.bg.removeEventListener(MouseEvent.CLICK,this.§1t6955s0§);
      }
      
      public function §1t6950s0§() : *
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < this.§1t6927s0§)
         {
            _loc1_ = this.§1t6928s0§[_loc2_].§1t6963s0§();
            if(_loc1_ != 0)
            {
               this.§1t6928s0§[_loc2_].§1t6966s0§(_loc1_,§1t1523s0§.§1t9714s0§(_loc1_));
            }
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < this.§1t6929s0§)
         {
            _loc1_ = this.§1t6012s0§[_loc2_].§1t6963s0§();
            if(_loc1_ != 0)
            {
               this.§1t6012s0§[_loc2_].§1t6966s0§(_loc1_,§1t1523s0§.§1t9714s0§(_loc1_));
            }
            _loc2_++;
         }
      }
      
      public function show() : *
      {
         this.visible = true;
         this.§1t5004s0§();
         this.§1t6937s0§();
         §1t1623s0§.instance.§1t1633s0§();
         if(§1t1540s0§.§1t9550s0§())
         {
            §1t251s0§.instance.§1t3532s0§(true);
         }
         this.§1t6954s0§();
         this.§1t6951s0§(0);
      }
      
      internal function §1t6951s0§(param1:int) : *
      {
         var _loc2_:int = 0;
         var _loc3_:§1t6907s0§ = null;
         var _loc4_:§1t105s0§ = null;
         var _loc5_:Vector.<§1t105s0§> = null;
         var _loc6_:int = 0;
         this.§1t6932s0§ = param1;
         if(param1 == 0)
         {
            this.§1t6952s0§(true);
            this.§1t6953s0§(true);
            _loc2_ = 0;
            while(_loc2_ < this.§1t6927s0§)
            {
               this.§1t6928s0§[_loc2_].visible = false;
               _loc2_++;
            }
            if(§1t6495s0§.instance.§1t1028s0§() == 9 || §1t6495s0§.instance.§1t1028s0§() == 10)
            {
               §1t6495s0§.instance.§1t1023s0§(8);
            }
         }
         else
         {
            §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
            this.§1t6952s0§(false);
            _loc5_ = §1t1524s0§.§1t9865s0§(param1);
            _loc6_ = int(_loc5_.length);
            _loc2_ = 0;
            while(_loc2_ < this.§1t6927s0§)
            {
               _loc3_ = this.§1t6928s0§[_loc2_];
               if(_loc2_ < _loc6_)
               {
                  _loc4_ = _loc5_[_loc2_];
                  _loc3_.§1t6966s0§(_loc4_.id,§1t1523s0§.§1t9714s0§(_loc4_.id));
                  _loc3_.visible = true;
               }
               else
               {
                  _loc3_.visible = false;
               }
               _loc2_++;
            }
            this.§1t6953s0§(false);
            if(§1t6495s0§.instance.§1t1028s0§() == 8)
            {
               if(param1 == 4)
               {
                  §1t6495s0§.instance.§1t1023s0§(9);
               }
               else
               {
                  §1t6495s0§.instance.§1t1023s0§(10);
               }
            }
         }
      }
      
      internal function §1t6952s0§(param1:Boolean) : *
      {
         var _loc2_:int = 0;
         var _loc3_:Array = null;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         this.categorylabel.visible = param1;
         _loc2_ = 0;
         while(_loc2_ < this.§1t6933s0§)
         {
            this.§1t6934s0§[_loc2_].visible = false;
            _loc2_++;
         }
         this.displayslot.visible = !param1;
         this.skilldesc.visible = !param1;
         this.§1t6923s0§.visible = !param1;
         this.§1t6926s0§.visible = !param1;
         this.§1t6921s0§.visible = false;
         this.§1t6917s0§.visible = !param1;
         if(param1)
         {
            _loc3_ = [0,1,2,3,4,5,6,7,8,9];
            if(!§1t1523s0§.§1t9490s0§)
            {
               if(§1t1523s0§.§1t7356s0§(§1t1523s0§.§1t1238s0§) == 0)
               {
                  _loc3_.splice(9,1);
               }
               if(§1t1523s0§.§1t7356s0§(§1t1523s0§.§1t1236s0§) == 0)
               {
                  _loc3_.splice(8,1);
               }
               if(§1t1523s0§.§1t7356s0§(§1t1523s0§.§1t1237s0§) == 0)
               {
                  _loc3_.splice(7,1);
               }
               if(§1t1523s0§.§1t7356s0§(§1t1523s0§.§1t1235s0§) == 0)
               {
                  _loc3_.splice(6,1);
               }
            }
            _loc4_ = 396.65;
            _loc5_ = 187.3;
            _loc6_ = 70;
            _loc7_ = 70;
            _loc2_ = 0;
            while(_loc2_ < _loc3_.length)
            {
               this.§1t6934s0§[_loc3_[_loc2_]].visible = true;
               this.§1t6934s0§[_loc3_[_loc2_]].x = _loc4_ + _loc6_ * (_loc2_ % 5);
               this.§1t6934s0§[_loc3_[_loc2_]].y = _loc5_ + _loc7_ * Math.floor(_loc2_ / 5);
               _loc2_++;
            }
         }
      }
      
      internal function §1t6953s0§(param1:Boolean) : *
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         this.displayslot.visible = !param1;
         this.skilldesc.visible = !param1;
         this.§1t6923s0§.visible = false;
         this.§1t6926s0§.visible = false;
         this.§1t6921s0§.visible = false;
         this.§1t6920s0§.visible = false;
         if(this.§1t6932s0§ != 0 && param1)
         {
            this.displayslot.visible = true;
            this.skilldesc.visible = true;
            this.displayslot.§1t6966s0§(this.§1t6935s0§[this.§1t6932s0§ - 1],1);
            this.skilldesc.htmlText = §1t1521s0§.getString(this.§1t6936s0§[this.§1t6932s0§ - 1]);
            if(this.§1t6932s0§ == 7)
            {
               this.§1t6920s0§.visible = true;
               this.§1t6920s0§.gotoAndStop(1);
               _loc2_ = §1t1523s0§.§1t7358s0§(§1t1523s0§.§1t1235s0§);
               this.§1t6920s0§.atk.htmlText = §1t1523s0§.§1t7356s0§(§1t1523s0§.§1t1235s0§);
            }
            else if(this.§1t6932s0§ == 8)
            {
               this.§1t6920s0§.visible = true;
               this.§1t6920s0§.gotoAndStop(2);
               _loc2_ = §1t1523s0§.§1t7358s0§(§1t1523s0§.§1t1237s0§);
               this.§1t6920s0§.atk.htmlText = §1t1523s0§.§1t7356s0§(§1t1523s0§.§1t1237s0§);
            }
            else if(this.§1t6932s0§ == 9)
            {
               this.§1t6920s0§.visible = true;
               this.§1t6920s0§.gotoAndStop(3);
               _loc2_ = §1t1523s0§.§1t7358s0§(§1t1523s0§.§1t1236s0§);
               this.§1t6920s0§.atk.htmlText = §1t1523s0§.§1t7356s0§(§1t1523s0§.§1t1236s0§);
            }
            else if(this.§1t6932s0§ == 10)
            {
               this.§1t6920s0§.visible = true;
               this.§1t6920s0§.gotoAndStop(4);
               _loc2_ = §1t1523s0§.§1t7358s0§(§1t1523s0§.§1t1238s0§);
               this.§1t6920s0§.atk.htmlText = §1t1523s0§.§1t7356s0§(§1t1523s0§.§1t1238s0§);
            }
            if(_loc2_ > 0)
            {
               this.§1t6920s0§.atk.htmlText += "<font color=\'#FFCC00\'> + " + _loc2_.toString() + "</font>";
            }
         }
      }
      
      internal function §1t6954s0§() : *
      {
         var _loc1_:§1t6907s0§ = null;
         var _loc2_:int = int(§1t1523s0§.§1t6928s0§.length);
         var _loc3_:int = §1t1523s0§.§1t9602s0§();
         var _loc4_:int = 0;
         while(_loc4_ < this.§1t6929s0§)
         {
            _loc1_ = this.§1t6012s0§[_loc4_];
            if(_loc4_ < _loc2_)
            {
               if(§1t1523s0§.§1t6928s0§[_loc4_] != null && §1t1523s0§.§1t6928s0§[_loc4_].§1t760s0§() != 0)
               {
                  _loc1_.§1t6966s0§(§1t1523s0§.§1t6928s0§[_loc4_].§1t760s0§(),§1t1523s0§.§1t6928s0§[_loc4_].§1t761s0§());
               }
               else
               {
                  _loc1_.§1t6967s0§();
               }
            }
            else
            {
               _loc1_.§1t6967s0§();
            }
            _loc1_.visible = _loc4_ < _loc3_;
            _loc4_++;
         }
      }
      
      internal function §1t6955s0§(param1:MouseEvent) : *
      {
         this.§1t6953s0§(true);
         if(this.§1t5183s0§ != null)
         {
            this.§1t5183s0§.§1t6786s0§(false);
         }
         this.§1t5183s0§ = null;
         if(this.§1t6930s0§ != null)
         {
            this.§1t6930s0§.§1t6786s0§(false);
         }
         this.§1t6930s0§ = null;
      }
      
      internal function §1t5136s0§(param1:MouseEvent) : *
      {
         if(param1.target.§1t6963s0§() == 0)
         {
            return;
         }
         this.§1t5134s0§ = true;
         this.§1t5052s0§.x = mouseX;
         this.§1t5052s0§.y = mouseY;
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         if((param1.stageY - §1t1523s0§.§1t9360s0§) / §1t1523s0§.§1t9358s0§ < 360)
         {
            this.§1t6939s0§(param1);
            this.§1t5135s0§ = false;
            if(this.§1t5183s0§ != null && !this.§1t5183s0§.§1t1470s0§())
            {
               this.§1t5134s0§ = false;
            }
         }
         else
         {
            this.§1t6940s0§(param1);
            this.§1t5135s0§ = true;
            if(this.§1t6930s0§ != null && !this.§1t6930s0§.§1t1470s0§())
            {
               this.§1t5134s0§ = false;
            }
         }
      }
      
      internal function §1t5137s0§(param1:MouseEvent) : *
      {
         if(this.§1t5134s0§ && !this.§1t5052s0§.visible)
         {
            if(!§1t1523s0§.§1t9528s0§)
            {
               this.§1t5052s0§.alpha = 0.8;
            }
            this.§1t5052s0§.visible = true;
            this.§1t5052s0§.cacheAsBitmap = true;
            this.§1t5052s0§.startDrag();
         }
      }
      
      internal function §1t5138s0§(param1:MouseEvent) : *
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(this.§1t5134s0§ && this.§1t5052s0§.visible && this.§1t5052s0§.x > 265)
         {
            if(this.§1t5052s0§.y > 360)
            {
               _loc2_ = -1;
               _loc3_ = 0;
               while(_loc3_ < this.§1t6929s0§)
               {
                  if(this.§1t6012s0§[_loc3_].visible && this.§1t6012s0§[_loc3_].hitTestPoint(param1.stageX,param1.stageY))
                  {
                     _loc2_ = _loc3_;
                     break;
                  }
                  _loc3_++;
               }
               if(!this.§1t5135s0§)
               {
                  if(_loc2_ != -1)
                  {
                     this.§1t6947s0§(this.§1t5183s0§.§1t6963s0§(),this.§1t5183s0§.§1t4491s0§(),_loc2_);
                  }
                  else if(!this.§1t6949s0§(this.§1t5052s0§.§1t6963s0§()))
                  {
                     this.§1t6946s0§(null);
                  }
               }
               else if(_loc2_ == -1)
               {
                  this.§1t6946s0§(null);
               }
               else
               {
                  this.§1t6947s0§(this.§1t6930s0§.§1t6963s0§(),this.§1t6930s0§.§1t4491s0§(),_loc2_);
               }
            }
            else if(this.§1t5135s0§)
            {
               this.§1t6946s0§(null);
            }
         }
         this.§1t5134s0§ = false;
         this.§1t5052s0§.visible = false;
         this.§1t5052s0§.cacheAsBitmap = false;
         this.§1t5052s0§.stopDrag();
      }
      
      internal function §1t6956s0§(param1:MouseEvent) : *
      {
         if(param1.target.§1t6963s0§() == 0)
         {
            return;
         }
         if(param1.stageY < 360)
         {
            this.§1t6939s0§(param1);
            if(this.§1t5183s0§.§1t1470s0§())
            {
               this.§1t6946s0§(null);
            }
         }
         else
         {
            this.§1t6940s0§(param1);
            if(this.§1t6930s0§.§1t1470s0§())
            {
               this.§1t6946s0§(null);
            }
         }
      }
      
      internal function §1t6957s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         if(this.§1t5183s0§ != null)
         {
            this.§1t5183s0§.§1t6786s0§(false);
         }
         this.§1t5183s0§ = null;
         if(this.§1t6930s0§ != null)
         {
            this.§1t6930s0§.§1t6786s0§(false);
         }
         this.§1t6930s0§ = null;
         if(this.§1t6932s0§ > 0)
         {
            this.§1t6951s0§(0);
         }
      }
      
      public function §1t5026s0§(param1:MouseEvent) : void
      {
         §1t88s0§.instance.§1t1516s0§("Snd_back");
         if(this.§1t5183s0§ != null)
         {
            this.§1t5183s0§.§1t6786s0§(false);
         }
         this.§1t5183s0§ = null;
         if(this.§1t6930s0§ != null)
         {
            this.§1t6930s0§.§1t6786s0§(false);
         }
         this.§1t6930s0§ = null;
         if(§1t1540s0§.§1t10014s0§())
         {
            §1t6427s0§.refreshMap();
            §1t6427s0§.§1t12473s0§(true);
         }
         else
         {
            §1t1541s0§.§1t10045s0§();
            §1t251s0§.instance.§1t3532s0§(false);
            §1t406s0§.instance.§1t6578s0§();
         }
         §1t3317s0§.instance.§1t1946s0§();
         this.removeEventListeners();
         this.visible = false;
         §1t406s0§.instance.§1t6614s0§();
         §1t6495s0§.instance.§1t1023s0§(0);
         this.§1t6958s0§();
      }
      
      internal function §1t6958s0§() : *
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:* = undefined;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         if((§1t1523s0§.§1t9529s0§ != §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8880s0§) || !§1t1523s0§.§1t9483s0§) && §1t1523s0§.charname != §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8886s0§))
         {
            _loc1_ = §1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9426s0§);
            if(_loc1_ < 9)
            {
               _loc2_ = §1t1523s0§.§1t9714s0§(1000);
               _loc3_ = 0;
               _loc4_ = 2;
               while(_loc4_ <= _loc2_)
               {
                  _loc3_ += _loc4_ - 1;
                  _loc4_++;
               }
               _loc5_ = §1t1523s0§.§1t9714s0§(1001);
               _loc4_ = 2;
               while(_loc4_ <= _loc5_)
               {
                  _loc3_ += _loc4_ - 1;
                  _loc4_++;
               }
               _loc6_ = §1t1523s0§.§1t9714s0§(1002);
               _loc4_ = 2;
               while(_loc4_ <= _loc6_)
               {
                  _loc3_ += _loc4_ - 1;
                  _loc4_++;
               }
               _loc7_ = §1t1523s0§.§1t9714s0§(1008);
               _loc4_ = 1;
               while(_loc4_ <= _loc7_)
               {
                  _loc3_ += _loc4_;
                  _loc4_++;
               }
               _loc8_ = §1t1523s0§.§1t9714s0§(1009);
               _loc4_ = 1;
               while(_loc4_ <= _loc8_)
               {
                  _loc3_ += _loc4_;
                  _loc4_++;
               }
               _loc9_ = §1t1523s0§.§1t9714s0§(1011);
               _loc4_ = 1;
               while(_loc4_ <= _loc9_)
               {
                  _loc3_ += _loc4_;
                  _loc4_++;
               }
               _loc3_ += §1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9418s0§);
               _loc10_ = §1t1523s0§.getLevel() - 1 + _loc1_ * (§1t1523s0§.§1t9470s0§ - 1);
               if(_loc3_ > _loc10_ + 3)
               {
                  §1t3317s0§.instance.§1t1982s0§(_loc3_ + " " + _loc10_ + " " + §1t1521s0§.getString(81));
               }
               if(§1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9418s0§) > _loc10_ + 3)
               {
                  §1t3317s0§.instance.§1t1982s0§(§1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9418s0§) + " " + _loc10_ + " " + §1t1521s0§.getString(81) + "2");
               }
            }
         }
      }
   }
}


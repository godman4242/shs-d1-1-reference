package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   import playerio.§1t23s0§;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol583")]
   public class §1t7897s0§ extends MovieClip
   {
      
      public var §1t5002s0§:§1t5070s0§;
      
      public var commanderslabel:TextField;
      
      public var cover:RedBG;
      
      public var editButton:§1t5070s0§;
      
      public var general1:TextField;
      
      public var general10:TextField;
      
      public var general2:TextField;
      
      public var general3:TextField;
      
      public var general4:TextField;
      
      public var general5:TextField;
      
      public var general6:TextField;
      
      public var general7:TextField;
      
      public var general8:TextField;
      
      public var general9:TextField;
      
      public var leaderlabel:TextField;
      
      public var leadertext:TextField;
      
      public var §1t7912s0§:§1t5070s0§;
      
      public var pmSecondButton:§1t5070s0§;
      
      public var saveButton:§1t5070s0§;
      
      public var secondlabel:TextField;
      
      public var secondtext:TextField;
      
      public var titlelabel:TextField;
      
      internal var §1t7917s0§:Array;
      
      internal var §1t7918s0§:§1t23s0§;
      
      internal var side:int;
      
      public function §1t7897s0§()
      {
         super();
         §1t1521s0§.§1t9290s0§(this.titlelabel,true);
         this.titlelabel.text = §1t1521s0§.getString(11097);
         §1t1521s0§.§1t9290s0§(this.leaderlabel,true);
         this.leaderlabel.text = §1t1521s0§.getString(11098);
         §1t1521s0§.§1t9290s0§(this.secondlabel,true);
         this.secondlabel.text = §1t1521s0§.getString(11099);
         §1t1521s0§.§1t9290s0§(this.commanderslabel,true);
         this.commanderslabel.text = §1t1521s0§.getString(11100);
         §1t1521s0§.§1t9290s0§(this.leadertext);
         §1t1521s0§.§1t9290s0§(this.secondtext);
         this.§1t7917s0§ = new Array();
         this.§1t7917s0§.push(this.general1);
         this.§1t7917s0§.push(this.general2);
         this.§1t7917s0§.push(this.general3);
         this.§1t7917s0§.push(this.general4);
         this.§1t7917s0§.push(this.general5);
         this.§1t7917s0§.push(this.general6);
         this.§1t7917s0§.push(this.general7);
         this.§1t7917s0§.push(this.general8);
         this.§1t7917s0§.push(this.general9);
         this.§1t7917s0§.push(this.general10);
         var _loc1_:int = 0;
         while(_loc1_ < 10)
         {
            §1t1521s0§.§1t9290s0§(this.§1t7917s0§[_loc1_]);
            _loc1_++;
         }
         this.editButton.§1t5769s0§(§1t1521s0§.getString(384));
         this.saveButton.§1t5769s0§(§1t1521s0§.getString(11101));
         this.§1t5002s0§.§1t5769s0§(§1t1521s0§.getString(17));
         this.§1t7912s0§.§1t5769s0§(§1t1521s0§.getString(306));
         this.pmSecondButton.§1t5769s0§(§1t1521s0§.getString(306));
         stop();
      }
      
      public function §1t5004s0§() : *
      {
         this.editButton.addEventListener(MouseEvent.CLICK,this.§1t7920s0§);
         this.saveButton.addEventListener(MouseEvent.CLICK,this.§1t7921s0§);
         this.§1t5002s0§.addEventListener(MouseEvent.CLICK,this.§1t5330s0§);
         this.§1t7912s0§.addEventListener(MouseEvent.CLICK,this.§1t7922s0§);
         this.pmSecondButton.addEventListener(MouseEvent.CLICK,this.§1t7923s0§);
      }
      
      public function removeEventListeners() : *
      {
         this.editButton.removeEventListener(MouseEvent.CLICK,this.§1t7920s0§);
         this.saveButton.removeEventListener(MouseEvent.CLICK,this.§1t7921s0§);
         this.§1t5002s0§.removeEventListener(MouseEvent.CLICK,this.§1t5330s0§);
         this.§1t7912s0§.removeEventListener(MouseEvent.CLICK,this.§1t7922s0§);
         this.pmSecondButton.removeEventListener(MouseEvent.CLICK,this.§1t7923s0§);
      }
      
      public function show() : *
      {
         this.cover.visible = true;
         if(this.§1t7918s0§ == null || this.side != §1t1523s0§.§1t7746s0§())
         {
            §1t406s0§.instance.§1t6482s0§.loading.visible = true;
            §1t3318s0§.instance.§1t3453s0§(§1t1523s0§.§1t7746s0§());
         }
         else
         {
            this.§1t7919s0§(this.§1t7918s0§);
         }
      }
      
      public function §1t7919s0§(param1:§1t23s0§) : *
      {
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = false;
         this.§1t5004s0§();
         visible = true;
         if(this.§1t7918s0§ == null)
         {
            this.§1t7918s0§ = param1;
         }
         this.side = §1t1523s0§.§1t7746s0§();
         §1t406s0§.instance.§1t6482s0§.loading.visible = false;
         this.leadertext.text = this.§1t7918s0§.leader;
         this.secondtext.text = this.§1t7918s0§.second;
         _loc2_ = §1t1523s0§.charname == this.§1t7918s0§.leader;
         _loc3_ = §1t1523s0§.charname == this.§1t7918s0§.second;
         this.leadertext.background = false;
         this.secondtext.background = false;
         this.leadertext.type = TextFieldType.DYNAMIC;
         this.secondtext.type = TextFieldType.DYNAMIC;
         var _loc4_:int = int(this.§1t7918s0§.rogues.length);
         var _loc5_:int = 0;
         while(_loc5_ < 10)
         {
            if(_loc5_ < _loc4_)
            {
               this.§1t7917s0§[_loc5_].text = this.§1t7918s0§.rogues[_loc5_];
            }
            else
            {
               this.§1t7917s0§[_loc5_].text = "";
            }
            this.§1t7917s0§[_loc5_].background = false;
            this.§1t7917s0§[_loc5_].type = TextFieldType.DYNAMIC;
            _loc5_++;
         }
         this.editButton.visible = _loc2_ || _loc3_;
         this.saveButton.visible = false;
         this.§1t5002s0§.visible = false;
         this.cover.visible = !(_loc2_ || _loc3_);
         this.§1t7912s0§.visible = true;
         this.pmSecondButton.visible = true;
      }
      
      public function hide() : *
      {
         this.removeEventListeners();
         visible = false;
      }
      
      internal function §1t7920s0§(param1:MouseEvent) : *
      {
         var _loc2_:Boolean = §1t1523s0§.charname == this.§1t7918s0§.leader;
         var _loc3_:Boolean = §1t1523s0§.charname == this.§1t7918s0§.second;
         this.secondtext.background = _loc2_;
         if(_loc2_)
         {
            this.secondtext.type = TextFieldType.INPUT;
         }
         else
         {
            this.secondtext.type = TextFieldType.DYNAMIC;
         }
         var _loc4_:int = int(this.§1t7918s0§.rogues.length);
         var _loc5_:int = 0;
         while(_loc5_ < 10)
         {
            if(_loc5_ < _loc4_)
            {
               this.§1t7917s0§[_loc5_].text = this.§1t7918s0§.rogues[_loc5_];
            }
            else
            {
               this.§1t7917s0§[_loc5_].text = "";
            }
            this.§1t7917s0§[_loc5_].background = _loc2_ || _loc3_;
            if(_loc2_ || _loc3_)
            {
               this.§1t7917s0§[_loc5_].type = TextFieldType.INPUT;
            }
            else
            {
               this.§1t7917s0§[_loc5_].type = TextFieldType.DYNAMIC;
            }
            _loc5_++;
         }
         this.editButton.visible = false;
         this.saveButton.visible = true;
         this.§1t5002s0§.visible = true;
         this.§1t7912s0§.visible = false;
         this.pmSecondButton.visible = false;
      }
      
      internal function §1t7921s0§(param1:MouseEvent) : *
      {
         if(§1t1523s0§.charname == this.§1t7918s0§.leader && this.secondtext.text != "")
         {
            this.§1t7918s0§.second = this.secondtext.text.toLowerCase();
         }
         var _loc2_:int = 0;
         while(_loc2_ < 10)
         {
            this.§1t7918s0§.rogues[_loc2_] = this.§1t7917s0§[_loc2_].text.toLowerCase();
            _loc2_++;
         }
         this.§1t7918s0§.save();
         this.§1t7919s0§(this.§1t7918s0§);
      }
      
      internal function §1t5330s0§(param1:MouseEvent) : *
      {
         this.§1t7919s0§(this.§1t7918s0§);
      }
      
      internal function §1t7922s0§(param1:MouseEvent) : *
      {
         if(this.leadertext.text != "")
         {
            §1t406s0§.instance.§1t6482s0§.§1t5026s0§(null);
            §1t406s0§.instance.§1t6499s0§.§1t6752s0§(this.leadertext.text);
         }
      }
      
      internal function §1t7923s0§(param1:MouseEvent) : *
      {
         if(this.secondtext.text != "")
         {
            §1t406s0§.instance.§1t6482s0§.§1t5026s0§(null);
            §1t406s0§.instance.§1t6499s0§.§1t6752s0§(this.secondtext.text);
         }
      }
   }
}


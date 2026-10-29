package
{
   import com.swfdefender.*;
   import flash.display.*;
   import flash.events.*;
   import flash.net.*;
   import flash.system.*;
   import flash.text.*;
   import flash.utils.*;
   
   public class la extends MovieClip
   {
      
      public var globalXML:String = "<config><scaleMode>NO_SCALE</scaleMode><alignMode>TOP_LEFT</alignMode></config>\r\n";
      
      internal var §\x18\x17\x0b\x18\x18\x17§:Array = new Array();
      
      internal var §\x17\t\t\x18\x17\x1b\x18\t§:Boolean = false;
      
      internal var loginSprite:*;
      
      internal var lockLoginSprite:Sprite;
      
      internal var lockTextField:*;
      
      internal var lockPassField:TextField;
      
      public function la()
      {
         super();
         this.addEventListener(Event.ADDED_TO_STAGE,this.onAddToStage);
      }
      
      private function onAddToStage(param1:Event) : void
      {
         if(false)
         {
         }
         this.initStage();
         this.§\t\n\n\x0b\x18\t\r\r\x18\x1b\x18§();
         this.§\x0b\x18\x1b\x1b\r\t\r\r\n\r\x0b\x1b\x18§();
         if(this.§\x17\t\t\x18\x17\x1b\x18\t§)
         {
            if(this.§\x18\x17\x0b\x18\x18\x17§.password)
            {
               this.displayLogin();
            }
            else
            {
               this.§\x17\n\x1b\x17\x18\x0b\x17\r\r§();
            }
            this.displayLogo();
            this.displayWatermark();
         }
         if(false)
         {
         }
      }
      
      private function initStage() : void
      {
         var _loc1_:XML = new XML(this.globalXML);
         if(_loc1_.scaleMode == "NO_SCALE")
         {
            this.stage.scaleMode = StageScaleMode.NO_SCALE;
         }
         if(_loc1_.alignMode == "TOP_LEFT")
         {
            this.stage.align = StageAlign.TOP_LEFT;
         }
         if(false)
         {
         }
      }
      
      private function §\x0b\x18\x1b\x1b\r\t\r\r\n\r\x0b\x1b\x18§() : void
      {
         var _loc1_:DomainMsg = null;
         var _loc2_:URLRequest = null;
         this.§\x17\t\t\x18\x17\x1b\x18\t§ = this.§\n\x1b\x18\x17\n\n\t\t§();
         if(!this.§\x17\t\t\x18\x17\x1b\x18\t§)
         {
            if(this.§\x18\x17\x0b\x18\x18\x17§.§\x17\r\x1b\x0b\t\n\n\t§)
            {
               _loc1_ = new DomainMsg(this.§\x18\x17\x0b\x18\x18\x17§.width,this.§\x18\x17\x0b\x18\x18\x17§.height,this.§\x18\x17\x0b\x18\x18\x17§.§\x0b\x18\x1b\x17\r\x0b\n\x17\x1b§,this.§\x18\x17\x0b\x18\x18\x17§.§\x0b\x1b\x1b\x18\n\x18\x1b§,this.§\x18\x17\x0b\x18\x18\x17§.§\x17\x0b\n\x1b\x18\x1b\r\t\x18§);
               this.addChild(_loc1_);
            }
            if(this.§\x18\x17\x0b\x18\x18\x17§.§\x18\x17\x1b\x18\x17\x18\x17\x1b§)
            {
               _loc2_ = new URLRequest(this.§\x18\x17\x0b\x18\x18\x17§.§\r\r\x0b\n\t\t\x18\x17§);
               navigateToURL(_loc2_);
            }
         }
      }
      
      private function §\n\x1b\x18\x17\n\n\t\t§() : Boolean
      {
         var _loc3_:int = 0;
         var _loc1_:String = root.loaderInfo.loaderURL;
         var _loc2_:Boolean = true;
         if(_loc1_.indexOf("file://") >= 0 || _loc1_.indexOf("127.0.0.1") >= 0 || _loc1_.indexOf("localhost") >= 0)
         {
            _loc2_ = !this.§\x18\x17\x0b\x18\x18\x17§.§\t\n\t\x1b\n\x18\x1b§;
         }
         else if(this.§\x18\x17\x0b\x18\x18\x17§.§\x1b\x18\x0b\t\x0b\x1b\x17\x0b\n\x17\x18§.length > 0)
         {
            _loc2_ = false;
            _loc3_ = 0;
            while(_loc3_ < this.§\x18\x17\x0b\x18\x18\x17§.§\x1b\x18\x0b\t\x0b\x1b\x17\x0b\n\x17\x18§.length)
            {
               if(_loc1_.indexOf(this.§\x18\x17\x0b\x18\x18\x17§.§\x1b\x18\x0b\t\x0b\x1b\x17\x0b\n\x17\x18§[_loc3_]) >= 0)
               {
                  _loc2_ = true;
                  break;
               }
               _loc3_++;
            }
         }
         return _loc2_;
      }
      
      private function §\t\n\n\x0b\x18\t\r\r\x18\x1b\x18§() : void
      {
         var _loc1_:ByteArray = ByteArray(new (getDefinitionByName("\t\n\x18\r\t\x17\t\x17\x18\t") as Class)());
         _loc1_.endian = "littleEndian";
         _loc1_.position = 0;
         this.§\x18\x17\x0b\x18\x18\x17§.§\n\x1b\x17\x18\x18\x17\x0b\n\x18§ = _loc1_.readUnsignedInt();
         this.§\x18\x17\x0b\x18\x18\x17§.width = _loc1_.readUnsignedInt();
         this.§\x18\x17\x0b\x18\x18\x17§.height = _loc1_.readUnsignedInt();
         this.§\x18\x17\x0b\x18\x18\x17§.level = _loc1_.readUnsignedByte();
         this.§\x18\x17\x0b\x18\x18\x17§.§\x17\n\x0b\n\n\x18\x1b\x17\n\x1b\r\x17\x0b§ = _loc1_.readUnsignedShort();
         this.§\x18\x17\x0b\x18\x18\x17§.§\x18\t\x0b\x0b\r\t\x0b\x1b§ = new ByteArray();
         this.§\x18\x17\x0b\x18\x18\x17§.§\x18\t\x0b\x0b\r\t\x0b\x1b§.writeBytes(_loc1_,_loc1_.position,this.§\x18\x17\x0b\x18\x18\x17§.§\x17\n\x0b\n\n\x18\x1b\x17\n\x1b\r\x17\x0b§);
         _loc1_.position += this.§\x18\x17\x0b\x18\x18\x17§.§\x17\n\x0b\n\n\x18\x1b\x17\n\x1b\r\x17\x0b§;
         this.§\x18\x17\x0b\x18\x18\x17§.§\x0b\x18\x18\r\r\n\x18\x1b\t\x17\n§ = _loc1_.readUnsignedShort();
         this.§\x18\x17\x0b\x18\x18\x17§.§\x1b\x18\x0b\t\x0b\x1b\x17\x0b\n\x17\x18§ = new Array();
         if(this.§\x18\x17\x0b\x18\x18\x17§.§\x0b\x18\x18\r\r\n\x18\x1b\t\x17\n§ > 0)
         {
            this.§\x18\x17\x0b\x18\x18\x17§.§\x1b\x18\x0b\t\x0b\x1b\x17\x0b\n\x17\x18§ = _loc1_.readUTFBytes(this.§\x18\x17\x0b\x18\x18\x17§.§\x0b\x18\x18\r\r\n\x18\x1b\t\x17\n§).split("!=!=!");
         }
         this.§\x18\x17\x0b\x18\x18\x17§.§\t\n\t\x1b\n\x18\x1b§ = _loc1_.readUnsignedByte();
         this.§\x18\x17\x0b\x18\x18\x17§.§\x17\r\x1b\x0b\t\n\n\t§ = _loc1_.readUnsignedByte();
         this.§\x18\x17\x0b\x18\x18\x17§.§\x18\x17\x1b\x18\x17\x18\x17\x1b§ = _loc1_.readUnsignedByte();
         this.§\x18\x17\x0b\x18\x18\x17§.§\n\t\x17\n\x18\x17\x17\t\x17\t\n\r§ = _loc1_.readUnsignedShort();
         if(this.§\x18\x17\x0b\x18\x18\x17§.§\n\t\x17\n\x18\x17\x17\t\x17\t\n\r§ > 0)
         {
            this.§\x18\x17\x0b\x18\x18\x17§.§\r\r\x0b\n\t\t\x18\x17§ = _loc1_.readUTFBytes(this.§\x18\x17\x0b\x18\x18\x17§.§\n\t\x17\n\x18\x17\x17\t\x17\t\n\r§);
         }
         this.§\x18\x17\x0b\x18\x18\x17§.§\x0b\x1b\x1b\x18\n\x18\x1b§ = _loc1_.readUnsignedInt();
         this.§\x18\x17\x0b\x18\x18\x17§.§\x17\x0b\n\x1b\x18\x1b\r\t\x18§ = _loc1_.readUnsignedByte();
         this.§\x18\x17\x0b\x18\x18\x17§.§\n\t\n\x0b\t\x17\x1b\t\x0b\x17\x1b§ = _loc1_.readUnsignedShort();
         this.§\x18\x17\x0b\x18\x18\x17§.§\x0b\x18\x1b\x17\r\x0b\n\x17\x1b§ = _loc1_.readUTFBytes(this.§\x18\x17\x0b\x18\x18\x17§.§\n\t\n\x0b\t\x17\x1b\t\x0b\x17\x1b§);
         this.§\x18\x17\x0b\x18\x18\x17§.§\r\r\x18\x17\t\t\x0b\x0b§ = _loc1_.readUnsignedByte();
         this.§\x18\x17\x0b\x18\x18\x17§.showLogo = _loc1_.readUnsignedByte();
         if(this.§\x18\x17\x0b\x18\x18\x17§.showLogo)
         {
            this.§\x18\x17\x0b\x18\x18\x17§.logoX = _loc1_.readUnsignedInt();
            this.§\x18\x17\x0b\x18\x18\x17§.logoY = _loc1_.readUnsignedInt();
            this.§\x18\x17\x0b\x18\x18\x17§.logoAlpha = _loc1_.readUnsignedInt();
         }
         this.§\x18\x17\x0b\x18\x18\x17§.password = _loc1_.readUnsignedByte();
         if(this.§\x18\x17\x0b\x18\x18\x17§.password)
         {
            this.§\x18\x17\x0b\x18\x18\x17§.passwordhashlength = _loc1_.readUnsignedShort();
            this.§\x18\x17\x0b\x18\x18\x17§.passwordhash = _loc1_.readUTFBytes(this.§\x18\x17\x0b\x18\x18\x17§.passwordhashlength);
            this.§\x18\x17\x0b\x18\x18\x17§.passwordtextlength = _loc1_.readUnsignedShort();
            this.§\x18\x17\x0b\x18\x18\x17§.passwordtext = _loc1_.readUTFBytes(this.§\x18\x17\x0b\x18\x18\x17§.passwordtextlength);
            this.§\x18\x17\x0b\x18\x18\x17§.passwordsubmitlength = _loc1_.readUnsignedShort();
            this.§\x18\x17\x0b\x18\x18\x17§.passwordsubmit = _loc1_.readUTFBytes(this.§\x18\x17\x0b\x18\x18\x17§.passwordsubmitlength);
            this.§\x18\x17\x0b\x18\x18\x17§.passwordinvalidlength = _loc1_.readUnsignedShort();
            this.§\x18\x17\x0b\x18\x18\x17§.passwordinvalid = _loc1_.readUTFBytes(this.§\x18\x17\x0b\x18\x18\x17§.passwordinvalidlength);
         }
         this.§\x18\x17\x0b\x18\x18\x17§.§\r\x17\t\x0b\r\x18\x1b\r\x1b\x18\x18§ = new ByteArray();
         this.§\x18\x17\x0b\x18\x18\x17§.§\r\x17\t\x0b\r\x18\x1b\r\x1b\x18\x18§.writeBytes(_loc1_,_loc1_.position,_loc1_.length - _loc1_.position);
      }
      
      private function §\x17\n\x1b\x17\x18\x0b\x17\r\r§() : void
      {
         switch(this.§\x18\x17\x0b\x18\x18\x17§.level)
         {
            case 0:
               Comp.C1(this.§\x18\x17\x0b\x18\x18\x17§.§\r\x17\t\x0b\r\x18\x1b\r\x1b\x18\x18§,this.§\x18\x17\x0b\x18\x18\x17§.§\x18\t\x0b\x0b\r\t\x0b\x1b§,64);
               break;
            case 1:
               Comp.C2(this.§\x18\x17\x0b\x18\x18\x17§.§\r\x17\t\x0b\r\x18\x1b\r\x1b\x18\x18§,this.§\x18\x17\x0b\x18\x18\x17§.§\x18\t\x0b\x0b\r\t\x0b\x1b§,64);
         }
         var _loc1_:Loader = new Loader();
         this.addChildAt(_loc1_,0);
         var _loc2_:LoaderContext = new LoaderContext();
         _loc2_.applicationDomain = new ApplicationDomain();
         _loc1_.loadBytes(this.§\x18\x17\x0b\x18\x18\x17§.§\r\x17\t\x0b\r\x18\x1b\r\x1b\x18\x18§,_loc2_);
         if(false)
         {
         }
      }
      
      private function displayWatermark() : void
      {
         var _loc1_:* = undefined;
         var _loc2_:TextFormat = null;
         var _loc3_:* = undefined;
         if(this.§\x18\x17\x0b\x18\x18\x17§.§\r\r\x18\x17\t\t\x0b\x0b§)
         {
            _loc1_ = new TextField();
            _loc1_.multiline = true;
            _loc1_.wordWrap = false;
            _loc1_.selectable = false;
            _loc1_.htmlText = "<a href=\'http://www.magichtml.com/swfprotection/watermark.html?ref=protectionmark\'><font face=\'Arial,Verdana\'>http://www.magichtml.com<br />Register Now to Remove this Watermark</font></a>";
            _loc1_.autoSize = TextFieldAutoSize.LEFT;
            _loc2_ = new TextFormat();
            _loc2_.align = TextFormatAlign.CENTER;
            _loc1_.setTextFormat(_loc2_);
            _loc1_.x = this.§\x18\x17\x0b\x18\x18\x17§.width - _loc1_.width - 4;
            _loc1_.y = this.§\x18\x17\x0b\x18\x18\x17§.height - _loc1_.height - 4;
            _loc3_ = new Sprite();
            _loc3_.graphics.beginFill(16777215);
            _loc3_.graphics.drawRoundRect(0,0,_loc1_.width + 8,_loc1_.height + 8,8,8);
            _loc3_.graphics.endFill();
            _loc3_.x = this.§\x18\x17\x0b\x18\x18\x17§.width - _loc1_.width - 8;
            _loc3_.y = this.§\x18\x17\x0b\x18\x18\x17§.height - _loc1_.height - 8;
            _loc3_.alpha = 0.4;
            this.addChild(_loc3_);
            this.addChild(_loc1_);
         }
      }
      
      private function displayLogin() : void
      {
         this.loginSprite = new Sprite();
         this.addChild(this.loginSprite);
         this.lockTextField = new TextField();
         this.loginSprite.addChild(this.lockTextField);
         this.lockTextField.width = this.§\x18\x17\x0b\x18\x18\x17§.width;
         this.lockTextField.height = 30;
         this.lockTextField.selectable = false;
         this.lockTextField.text = this.§\x18\x17\x0b\x18\x18\x17§.passwordtext;
         this.lockTextField.x = 0;
         this.lockTextField.y = this.§\x18\x17\x0b\x18\x18\x17§.height / 3;
         var _loc1_:TextFormat = new TextFormat();
         _loc1_.align = TextFormatAlign.CENTER;
         _loc1_.font = "Arial";
         _loc1_.color = 3355443;
         _loc1_.size = 14;
         this.lockTextField.setTextFormat(_loc1_);
         this.lockPassField = new TextField();
         this.loginSprite.addChild(this.lockPassField);
         var _loc2_:TextFormat = new TextFormat();
         _loc2_.align = TextFormatAlign.CENTER;
         this.lockPassField.defaultTextFormat = _loc2_;
         this.lockPassField.type = TextFieldType.INPUT;
         this.lockPassField.displayAsPassword = true;
         this.lockPassField.border = true;
         this.lockPassField.width = 160;
         this.lockPassField.height = 20;
         this.lockPassField.x = this.§\x18\x17\x0b\x18\x18\x17§.width / 2 - 80;
         this.lockPassField.y = this.§\x18\x17\x0b\x18\x18\x17§.height / 3 + 30;
         var _loc3_:* = new TextField();
         _loc3_.width = 80;
         _loc3_.height = 20;
         _loc3_.selectable = false;
         _loc3_.text = this.§\x18\x17\x0b\x18\x18\x17§.passwordsubmit;
         _loc3_.background = true;
         _loc3_.backgroundColor = 3355443;
         var _loc4_:TextFormat = new TextFormat();
         _loc4_.align = TextFormatAlign.CENTER;
         _loc4_.font = "Arial";
         _loc4_.color = 13421772;
         _loc4_.size = 12;
         _loc3_.setTextFormat(_loc4_);
         this.lockLoginSprite = new Sprite();
         this.lockLoginSprite.x = this.§\x18\x17\x0b\x18\x18\x17§.width / 2 - 40;
         this.lockLoginSprite.y = this.§\x18\x17\x0b\x18\x18\x17§.height / 3 + 60;
         this.lockLoginSprite.addChild(_loc3_);
         this.lockLoginSprite.buttonMode = true;
         this.lockLoginSprite.mouseChildren = false;
         this.loginSprite.addChild(this.lockLoginSprite);
         this.lockLoginSprite.addEventListener(MouseEvent.CLICK,this.submitHandler);
         this.lockPassField.addEventListener(KeyboardEvent.KEY_DOWN,this.enterHandler);
      }
      
      internal function enterHandler(param1:KeyboardEvent) : *
      {
         if(param1.charCode == 13)
         {
            this.unlockProtection();
         }
      }
      
      internal function submitHandler(param1:MouseEvent) : void
      {
         this.unlockProtection();
      }
      
      internal function unlockProtection() : void
      {
         if(false)
         {
         }
         var _loc3_:* = undefined;
         var _loc4_:Loader = null;
         var _loc5_:LoaderContext = null;
         var _loc6_:TextFormat = null;
         var _loc1_:* = this.lockPassField.text;
         var _loc2_:* = MD5.hash(_loc1_);
         if(_loc2_ == this.§\x18\x17\x0b\x18\x18\x17§.passwordhash)
         {
            this.lockLoginSprite.removeEventListener(MouseEvent.CLICK,this.submitHandler);
            this.lockPassField.removeEventListener(KeyboardEvent.KEY_DOWN,this.enterHandler);
            this.removeChild(this.loginSprite);
            _loc3_ = new ByteArray();
            _loc3_.writeUTFBytes(_loc1_);
            Comp.C2(this.§\x18\x17\x0b\x18\x18\x17§.§\r\x17\t\x0b\r\x18\x1b\r\x1b\x18\x18§,_loc3_,64);
            _loc4_ = new Loader();
            this.addChildAt(_loc4_,0);
            _loc5_ = new LoaderContext();
            _loc5_.applicationDomain = new ApplicationDomain();
            _loc4_.loadBytes(this.§\x18\x17\x0b\x18\x18\x17§.§\r\x17\t\x0b\r\x18\x1b\r\x1b\x18\x18§,_loc5_);
         }
         else
         {
            this.lockTextField.text = this.§\x18\x17\x0b\x18\x18\x17§.passwordinvalid;
            _loc6_ = new TextFormat();
            _loc6_.align = TextFormatAlign.CENTER;
            _loc6_.font = "Arial";
            _loc6_.color = 16711680;
            _loc6_.size = 14;
            this.lockTextField.setTextFormat(_loc6_);
         }
         if(false)
         {
         }
      }
      
      private function displayLogo() : void
      {
         var _loc1_:Class = null;
         var _loc2_:BitmapData = null;
         var _loc3_:Bitmap = null;
         var _loc4_:MovieClip = null;
         if(this.§\x18\x17\x0b\x18\x18\x17§.showLogo)
         {
            _loc1_ = getDefinitionByName("LOGO") as Class;
            _loc2_ = new _loc1_(0,0);
            _loc3_ = new Bitmap(_loc2_);
            _loc4_ = new MovieClip();
            _loc4_.addChild(_loc3_);
            _loc4_.alpha = this.§\x18\x17\x0b\x18\x18\x17§.logoAlpha / 100;
            _loc4_.x = this.§\x18\x17\x0b\x18\x18\x17§.logoX;
            _loc4_.y = this.§\x18\x17\x0b\x18\x18\x17§.logoY;
            this.addChild(_loc4_);
         }
      }
   }
}


package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1810")]
   public class §1t5495s0§ extends MovieClip
   {
      
      public static var instance:§1t5495s0§;
      
      public var §1t5496s0§:TextField;
      
      public var centerButton:MovieClip;
      
      public var exitButton:SimpleButton;
      
      public var greenCircle:MovieClip;
      
      public var node0:§1t5501s0§;
      
      public var node1:§1t5501s0§;
      
      public var node2:§1t5501s0§;
      
      public var node3:§1t5501s0§;
      
      public var node4:§1t5501s0§;
      
      public var node5:§1t5501s0§;
      
      public var node6:§1t5501s0§;
      
      public var node7:§1t5501s0§;
      
      public var redCircle:MovieClip;
      
      internal var §1t5510s0§:Array;
      
      internal var §1t5511s0§:Array;
      
      internal var §1t5512s0§:Array;
      
      internal var §1t5513s0§:Array;
      
      internal var §1t5514s0§:Array;
      
      internal var §1t5515s0§:Array;
      
      internal var §1t5516s0§:Array;
      
      internal var §1t5517s0§:Array;
      
      internal var §1t5518s0§:String = "";
      
      internal var §1t5519s0§:Boolean;
      
      internal var §1t5520s0§:§1t397s0§;
      
      public function §1t5495s0§()
      {
         var i:int;
         var skillNode:§1t5501s0§ = null;
         super();
         instance = this;
         this.§1t5510s0§ = [this.node0,this.node1,this.node2,this.node3,this.node4,this.node5,this.node6,this.node7];
         this.§1t5512s0§ = [false,false,false,false,false,false,false,false];
         this.§1t5516s0§ = ["sky","wind","water","mountain","earth","thunder","fire","lake"];
         this.§1t5517s0§ = ["fire","earth","lake","sky","water","mountain","thunder","wind"];
         this.§1t5513s0§ = [function():*
         {
            §1t5525s0§(0);
         },function():*
         {
            §1t5525s0§(1);
         },function():*
         {
            §1t5525s0§(2);
         },function():*
         {
            §1t5525s0§(3);
         },function():*
         {
            §1t5525s0§(4);
         },function():*
         {
            §1t5525s0§(5);
         },function():*
         {
            §1t5525s0§(6);
         },function():*
         {
            §1t5525s0§(7);
         }];
         this.§1t5514s0§ = [function():*
         {
            §1t5527s0§(0);
         },function():*
         {
            §1t5527s0§(1);
         },function():*
         {
            §1t5527s0§(2);
         },function():*
         {
            §1t5527s0§(3);
         },function():*
         {
            §1t5527s0§(4);
         },function():*
         {
            §1t5527s0§(5);
         },function():*
         {
            §1t5527s0§(6);
         },function():*
         {
            §1t5527s0§(7);
         }];
         this.§1t5515s0§ = [function():*
         {
            §1t5528s0§(0);
         },function():*
         {
            §1t5528s0§(1);
         },function():*
         {
            §1t5528s0§(2);
         },function():*
         {
            §1t5528s0§(3);
         },function():*
         {
            §1t5528s0§(4);
         },function():*
         {
            §1t5528s0§(5);
         },function():*
         {
            §1t5528s0§(6);
         },function():*
         {
            §1t5528s0§(7);
         }];
         i = 0;
         while(i < 8)
         {
            this.§1t5510s0§[i].word.mouseEnabled = false;
            this.§1t5510s0§[i].mouseChildren = false;
            this.§1t5510s0§[i].node.buttonMode = true;
            i++;
         }
         this.§1t5511s0§ = new Array();
         i = 0;
         while(i < 16)
         {
            skillNode = new §1t5501s0§();
            this.§1t5511s0§[i] = skillNode;
            skillNode.x = 400 + i * 50;
            skillNode.y = 459;
            skillNode.scaleX = 0.6;
            skillNode.scaleY = 0.6;
            skillNode.mouseChildren = false;
            skillNode.mouseEnabled = false;
            addChild(skillNode);
            i++;
         }
         this.centerButton.buttonMode = true;
         this.centerButton.mouseEnabled = true;
         §1t1521s0§.§1t9290s0§(this.§1t5496s0§);
         this.§1t5496s0§.mouseEnabled = false;
      }
      
      internal function §1t5004s0§() : *
      {
         var _loc1_:int = 0;
         while(_loc1_ < 8)
         {
            this.§1t5510s0§[_loc1_].node.addEventListener(MouseEvent.CLICK,this.§1t5513s0§[_loc1_]);
            this.§1t5510s0§[_loc1_].node.addEventListener(MouseEvent.MOUSE_OVER,this.§1t5514s0§[_loc1_]);
            this.§1t5510s0§[_loc1_].node.addEventListener(MouseEvent.MOUSE_OUT,this.§1t5515s0§[_loc1_]);
            _loc1_++;
         }
         this.centerButton.addEventListener(MouseEvent.CLICK,this.§1t5529s0§);
         this.centerButton.addEventListener(MouseEvent.MOUSE_OVER,this.§1t5530s0§);
         this.centerButton.addEventListener(MouseEvent.MOUSE_OUT,this.§1t5531s0§);
         this.exitButton.addEventListener(MouseEvent.CLICK,this.§1t5532s0§);
      }
      
      internal function removeEventListeners() : *
      {
         var _loc1_:int = 0;
         while(_loc1_ < 8)
         {
            this.§1t5510s0§[_loc1_].node.removeEventListener(MouseEvent.CLICK,this.§1t5513s0§[_loc1_]);
            this.§1t5510s0§[_loc1_].node.removeEventListener(MouseEvent.MOUSE_OVER,this.§1t5514s0§[_loc1_]);
            this.§1t5510s0§[_loc1_].node.removeEventListener(MouseEvent.MOUSE_OUT,this.§1t5515s0§[_loc1_]);
            _loc1_++;
         }
         this.centerButton.removeEventListener(MouseEvent.CLICK,this.§1t5529s0§);
         this.centerButton.removeEventListener(MouseEvent.MOUSE_OVER,this.§1t5530s0§);
         this.centerButton.removeEventListener(MouseEvent.MOUSE_OUT,this.§1t5531s0§);
         this.exitButton.removeEventListener(MouseEvent.CLICK,this.§1t5532s0§);
      }
      
      internal function §1t5521s0§() : *
      {
         var _loc1_:int = 0;
         this.greenCircle.visible = true;
         this.redCircle.visible = false;
         this.centerButton.gotoAndStop("green");
         this.§1t5518s0§ = "";
         this.§1t5496s0§.text = "";
         _loc1_ = 0;
         while(_loc1_ < 16)
         {
            this.§1t5511s0§[_loc1_].visible = false;
            _loc1_++;
         }
         this.§1t5512s0§ = [false,false,false,false,false,false,false,false];
         this.§1t5519s0§ = true;
         _loc1_ = 0;
         while(_loc1_ < 8)
         {
            if(this.§1t5524s0§(_loc1_))
            {
               this.§1t5510s0§[_loc1_].word.visible = true;
               this.§1t5510s0§[_loc1_].word.gotoAndStop(_loc1_ + 1);
               this.§1t5510s0§[_loc1_].node.gotoAndStop("green");
               this.§1t5510s0§[_loc1_].mouseEnabled = true;
               this.§1t5510s0§[_loc1_].mouseChildren = true;
            }
            else
            {
               this.§1t5510s0§[_loc1_].word.visible = false;
               this.§1t5510s0§[_loc1_].node.gotoAndStop("greendisabled");
               this.§1t5510s0§[_loc1_].mouseEnabled = false;
               this.§1t5510s0§[_loc1_].mouseChildren = false;
            }
            _loc1_++;
         }
      }
      
      internal function §1t5522s0§() : *
      {
         this.§1t5519s0§ = false;
         this.greenCircle.visible = false;
         this.redCircle.visible = true;
         this.§1t5496s0§.text = "";
         this.centerButton.gotoAndStop("red");
         var _loc1_:int = 0;
         while(_loc1_ < 8)
         {
            if(this.§1t5524s0§(_loc1_))
            {
               this.§1t5510s0§[_loc1_].word.visible = true;
               this.§1t5510s0§[_loc1_].word.gotoAndStop(_loc1_ + 21);
               this.§1t5510s0§[_loc1_].node.gotoAndStop("red");
               this.§1t5510s0§[_loc1_].mouseEnabled = true;
               this.§1t5510s0§[_loc1_].mouseChildren = true;
            }
            else
            {
               this.§1t5510s0§[_loc1_].word.visible = false;
               this.§1t5510s0§[_loc1_].mouseEnabled = false;
               this.§1t5510s0§[_loc1_].mouseChildren = false;
               this.§1t5510s0§[_loc1_].node.gotoAndStop("reddisabled");
            }
            _loc1_++;
         }
         this.§1t5512s0§ = [false,false,false,false,false,false,false,false];
      }
      
      public function show(param1:§1t397s0§ = null) : *
      {
         this.§1t5520s0§ = param1;
         §1t406s0§.instance.§1t6613s0§();
         visible = true;
         this.§1t5004s0§();
         this.§1t5521s0§();
         if(param1 != null && param1.getSequence() != "")
         {
            this.§1t5526s0§();
         }
      }
      
      public function hide() : *
      {
         visible = false;
         this.removeEventListeners();
         §1t1541s0§.§1t10045s0§();
         §1t406s0§.instance.§1t6610s0§();
      }
      
      internal function §1t5524s0§(param1:int) : Boolean
      {
         if(this.§1t5520s0§ != null)
         {
            if(this.§1t5519s0§ && this.§1t5520s0§.nodeTaught() == param1)
            {
               return true;
            }
            if(!this.§1t5519s0§ && this.§1t5520s0§.nodeTaught() == param1 + 8)
            {
               return true;
            }
         }
         if(this.§1t5519s0§)
         {
            if(§1t1523s0§.§1t9714s0§(40002 + param1) == 1)
            {
               return true;
            }
            if(param1 == 6 && §1t1523s0§.§1t9714s0§(1056) == 1)
            {
               return true;
            }
            if(param1 == 2 && §1t1523s0§.§1t9714s0§(1057) == 1)
            {
               return true;
            }
            if(param1 == 1 && §1t1523s0§.§1t9714s0§(1058) == 1)
            {
               return true;
            }
            if(param1 == 4 && §1t1523s0§.§1t9714s0§(1059) == 1)
            {
               return true;
            }
            return false;
         }
         if(§1t1523s0§.§1t9714s0§(40010 + param1) == 1)
         {
            return true;
         }
         if(param1 == 0 && §1t1523s0§.§1t9714s0§(1060) == 1)
         {
            return true;
         }
         if(param1 == 4 && §1t1523s0§.§1t9714s0§(1061) == 1)
         {
            return true;
         }
         if(param1 == 7 && §1t1523s0§.§1t9714s0§(1062) == 1)
         {
            return true;
         }
         if(param1 == 1 && §1t1523s0§.§1t9714s0§(1063) == 1)
         {
            return true;
         }
         return false;
      }
      
      internal function §1t5525s0§(param1:int) : *
      {
         var _loc2_:String = null;
         if(this.§1t5512s0§[param1])
         {
            return;
         }
         §1t88s0§.instance.§1t1516s0§("Snd_click");
         if(this.§1t5518s0§ == "")
         {
            §1t1523s0§.§1t9586s0§().§1t1559s0§().§1t5493s0§();
         }
         this.§1t5512s0§[param1] = true;
         this.§1t5518s0§ += param1.toString();
         if(this.§1t5519s0§)
         {
            this.§1t5510s0§[param1].node.gotoAndStop("selected");
            this.§1t5510s0§[param1].word.gotoAndStop(param1 + 11);
         }
         else
         {
            this.§1t5510s0§[param1].node.gotoAndStop("selected");
            this.§1t5510s0§[param1].word.gotoAndStop(param1 + 31);
         }
         this.§1t5526s0§();
         if(Boolean(this.§1t5519s0§ && this.§1t5518s0§.length == 4) && Boolean(this.§1t5512s0§[1]) && Boolean(this.§1t5512s0§[2]) && Boolean(this.§1t5512s0§[4]) && Boolean(this.§1t5512s0§[6]))
         {
            this.§1t5522s0§();
         }
         if(§1t1523s0§.§1t9586s0§().§1t4469s0§())
         {
            if(this.§1t5519s0§)
            {
               if(param1 == 0)
               {
                  _loc2_ = §1t1544s0§.§1t10389s0§;
               }
               else if(param1 == 1)
               {
                  _loc2_ = §1t1544s0§.§1t10397s0§;
               }
               else if(param1 == 2)
               {
                  _loc2_ = §1t1544s0§.§1t10391s0§;
               }
               else if(param1 == 3)
               {
                  _loc2_ = §1t1544s0§.§1t10393s0§;
               }
               else if(param1 == 4)
               {
                  _loc2_ = §1t1544s0§.§1t10385s0§;
               }
               else if(param1 == 5)
               {
                  _loc2_ = §1t1544s0§.§1t10395s0§;
               }
               else if(param1 == 6)
               {
                  _loc2_ = §1t1544s0§.§1t10383s0§;
               }
               else if(param1 == 7)
               {
                  _loc2_ = §1t1544s0§.§1t10387s0§;
               }
            }
            else if(param1 == 0)
            {
               _loc2_ = §1t1544s0§.§1t10383s0§;
            }
            else if(param1 == 1)
            {
               _loc2_ = §1t1544s0§.§1t10385s0§;
            }
            else if(param1 == 2)
            {
               _loc2_ = §1t1544s0§.§1t10387s0§;
            }
            else if(param1 == 3)
            {
               _loc2_ = §1t1544s0§.§1t10389s0§;
            }
            else if(param1 == 4)
            {
               _loc2_ = §1t1544s0§.§1t10391s0§;
            }
            else if(param1 == 5)
            {
               _loc2_ = §1t1544s0§.§1t10393s0§;
            }
            else if(param1 == 6)
            {
               _loc2_ = §1t1544s0§.§1t10395s0§;
            }
            else if(param1 == 7)
            {
               _loc2_ = §1t1544s0§.§1t10397s0§;
            }
            §1t1523s0§.§1t9586s0§().§1t1557s0§(_loc2_);
            §1t251s0§.instance.§1t3533s0§(_loc2_);
            if(this.§1t5520s0§ != null)
            {
               this.§1t5520s0§.§1t6246s0§(_loc2_);
            }
         }
         if(this.§1t5520s0§ != null && this.§1t5520s0§.getSequence() == this.§1t5518s0§)
         {
            this.hide();
            this.§1t5520s0§.validSequence();
         }
      }
      
      internal function §1t5526s0§() : *
      {
         var _loc1_:§1t5501s0§ = null;
         var _loc6_:int = 0;
         var _loc9_:Array = null;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc2_:int = this.§1t5518s0§.length;
         var _loc3_:int = 0;
         var _loc4_:String = "";
         var _loc5_:Boolean = false;
         if(this.§1t5520s0§ != null)
         {
            _loc4_ = this.§1t5520s0§.getSequence();
            _loc3_ = _loc4_.length;
            if(_loc3_ > 4)
            {
               _loc9_ = [false,false,false,false];
               _loc10_ = 0;
               while(_loc10_ < 4)
               {
                  _loc11_ = int(_loc4_.charAt(_loc10_));
                  if(_loc11_ == 1)
                  {
                     _loc9_[0] = true;
                  }
                  else if(_loc11_ == 2)
                  {
                     _loc9_[1] = true;
                  }
                  else if(_loc11_ == 4)
                  {
                     _loc9_[2] = true;
                  }
                  else if(_loc11_ == 6)
                  {
                     _loc9_[3] = true;
                  }
                  _loc10_++;
               }
               _loc5_ = Boolean(_loc9_[0]) && Boolean(_loc9_[1]) && Boolean(_loc9_[2]) && Boolean(_loc9_[3]);
            }
         }
         var _loc7_:* = _loc2_;
         if(_loc3_ > _loc2_)
         {
            _loc7_ = _loc3_;
         }
         var _loc8_:int = 0;
         while(_loc8_ < 16)
         {
            _loc1_ = this.§1t5511s0§[_loc8_];
            if(_loc2_ > _loc8_)
            {
               _loc1_.visible = true;
               _loc6_ = int(this.§1t5518s0§.charAt(_loc8_));
               if(!this.§1t5519s0§ && _loc8_ > 3)
               {
                  _loc1_.node.gotoAndStop("red");
                  _loc1_.word.gotoAndStop(_loc6_ + 21);
               }
               else
               {
                  _loc1_.node.gotoAndStop("green");
                  _loc1_.word.gotoAndStop(_loc6_ + 1);
               }
               _loc1_.x = 400 + _loc8_ * 50 - (_loc7_ - 1) * 25;
            }
            else if(_loc8_ < _loc3_)
            {
               _loc1_.visible = true;
               _loc6_ = int(_loc4_.charAt(_loc8_));
               if(_loc5_ && _loc8_ > 3)
               {
                  _loc1_.node.gotoAndStop("reddisabled");
                  _loc1_.word.gotoAndStop(_loc6_ + 21);
               }
               else
               {
                  _loc1_.node.gotoAndStop("greendisabled");
                  _loc1_.word.gotoAndStop(_loc6_ + 1);
               }
               _loc1_.x = 400 + _loc8_ * 50 - (_loc7_ - 1) * 25;
            }
            else
            {
               _loc1_.visible = false;
            }
            _loc8_++;
         }
      }
      
      internal function §1t5527s0§(param1:int) : *
      {
         if(this.§1t5519s0§)
         {
            this.§1t5496s0§.text = this.§1t5516s0§[param1];
         }
         else
         {
            this.§1t5496s0§.text = this.§1t5517s0§[param1];
         }
         if(this.§1t5512s0§[param1])
         {
            return;
         }
         if(this.§1t5519s0§)
         {
            this.§1t5510s0§[param1].node.gotoAndStop("greenmouseover");
         }
         else
         {
            this.§1t5510s0§[param1].node.gotoAndStop("redmouseover");
         }
      }
      
      internal function §1t5528s0§(param1:int) : *
      {
         this.§1t5496s0§.text = "";
         if(!this.§1t5519s0§ && !this.§1t5524s0§(param1))
         {
            this.§1t5510s0§[param1].node.gotoAndStop("reddisabled");
            return;
         }
         if(this.§1t5512s0§[param1])
         {
            return;
         }
         if(this.§1t5519s0§)
         {
            this.§1t5510s0§[param1].node.gotoAndStop("green");
         }
         else
         {
            this.§1t5510s0§[param1].node.gotoAndStop("red");
         }
      }
      
      internal function §1t5529s0§(param1:MouseEvent) : *
      {
         if(this.§1t5518s0§ == "1")
         {
            §1t88s0§.instance.§1t1512s0§();
            §1t251s0§.instance.§1t3533s0§("fart");
         }
         if(this.§1t5519s0§)
         {
            §1t1523s0§.§1t9586s0§().§1t1557s0§(§1t1544s0§.§1t10399s0§);
            §1t251s0§.instance.§1t3533s0§(§1t1544s0§.§1t10399s0§);
         }
         else
         {
            §1t1523s0§.§1t9586s0§().§1t1557s0§(§1t1544s0§.§1t10401s0§);
            §1t251s0§.instance.§1t3533s0§(§1t1544s0§.§1t10401s0§);
         }
         §1t88s0§.instance.§1t1516s0§("Snd_challenge");
         this.hide();
         if(this.§1t5520s0§ != null)
         {
            if(this.§1t5520s0§.getSequence() == this.§1t5518s0§)
            {
               this.§1t5520s0§.validSequence();
            }
            else
            {
               this.§1t5520s0§.invalidSequence();
            }
         }
      }
      
      internal function §1t5530s0§(param1:MouseEvent) : *
      {
         if(this.§1t5519s0§)
         {
            this.centerButton.gotoAndStop("greenmouseover");
         }
         else
         {
            this.centerButton.gotoAndStop("redmouseover");
         }
      }
      
      internal function §1t5531s0§(param1:MouseEvent) : *
      {
         if(this.§1t5519s0§)
         {
            this.centerButton.gotoAndStop("green");
         }
         else
         {
            this.centerButton.gotoAndStop("red");
         }
      }
      
      internal function §1t5532s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_back");
         this.hide();
      }
   }
}


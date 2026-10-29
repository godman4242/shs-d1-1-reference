package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1691")]
   public class §1t401s0§ extends MovieClip
   {
      
      public static var §1t12349s0§:int = 0;
      
      public static var §1t12350s0§:int = 1;
      
      public static var §1t12351s0§:int = 2;
      
      public static var §1t12352s0§:int = 3;
      
      public static var §1t12353s0§:int = 4;
      
      public static var §1t12354s0§:int = 5;
      
      public static var §1t12355s0§:int = 6;
      
      public static var §1t12356s0§:int = 7;
      
      public static var §1t12357s0§:int = 8;
      
      public static var §1t12358s0§:int = 9;
      
      public static var §1t12359s0§:int = 10;
      
      public static var §1t12360s0§:int = 11;
      
      public static var §1t12361s0§:int = 12;
      
      public static var §1t12362s0§:int = 13;
      
      public static var §1t12363s0§:int = 14;
      
      public static var §1t12364s0§:int = 15;
      
      public static var §1t12365s0§:int = 16;
      
      public static var §1t12366s0§:int = 17;
      
      public static var §1t12367s0§:int = 18;
      
      public static var §1t12368s0§:int = 19;
      
      public static var §1t12369s0§:int = 20;
      
      public var §1t5438s0§:§1t5488s0§;
      
      public var button1:§1t404s0§;
      
      public var button2:§1t404s0§;
      
      public var button3:§1t404s0§;
      
      public var button4:§1t404s0§;
      
      public var button5:§1t404s0§;
      
      public var button6:§1t404s0§;
      
      public var §1t5864s0§:§1t5865s0§;
      
      public var chohan:MovieClip;
      
      public var crops:§1t5868s0§;
      
      public var detailstext:TextField;
      
      public var elementCircle:MovieClip;
      
      public var kojuro:portrait_kojuro;
      
      public var loading:MovieClip;
      
      public var money:§1t5874s0§;
      
      public var npcname:MovieClip;
      
      public var titleText:MovieClip;
      
      internal var uimode:int;
      
      internal var §1t5877s0§:int;
      
      internal var §1t5878s0§:Number = §1t407s0§.instance.x + 10;
      
      internal var §1t5879s0§:Number = §1t407s0§.instance.y + 40;
      
      internal var §1t5880s0§:Number = §1t407s0§.instance.actionButtonHeight;
      
      internal var buttons:Array = new Array();
      
      internal var actions:Vector.<§1t766s0§> = new Vector.<§1t766s0§>();
      
      internal var §1t5883s0§:Boolean = false;
      
      internal var §1t5884s0§:Array = [10,10,10,10];
      
      internal var §1t5091s0§:§1t17s0§;
      
      internal var §1t5885s0§:§1t111s0§;
      
      internal var bet:int = 0;
      
      internal var §1t5914s0§:int;
      
      public function §1t401s0§()
      {
         super();
         this.button1.x = this.§1t5878s0§;
         this.button1.y = this.§1t5879s0§;
         this.buttons.push(this.button1);
         this.button2.x = this.§1t5878s0§;
         this.button2.y = this.§1t5879s0§ + this.§1t5880s0§;
         this.buttons.push(this.button2);
         this.button3.x = this.§1t5878s0§;
         this.button3.y = this.§1t5879s0§ + 2 * this.§1t5880s0§;
         this.buttons.push(this.button3);
         this.button4.x = this.§1t5878s0§;
         this.button4.y = this.§1t5879s0§ + 3 * this.§1t5880s0§;
         this.buttons.push(this.button4);
         this.button5.x = this.§1t5878s0§;
         this.button5.y = this.§1t5879s0§ + 4 * this.§1t5880s0§;
         this.buttons.push(this.button5);
         this.button6.x = this.§1t5878s0§;
         this.button6.y = this.§1t5879s0§ + 5 * this.§1t5880s0§;
         this.buttons.push(this.button6);
         §1t1521s0§.§1t9290s0§(this.titleText.label,true);
         §1t1521s0§.§1t9290s0§(this.detailstext);
         §1t1521s0§.§1t9290s0§(this.npcname.nametext,true);
         this.loading.prompt.text = §1t1521s0§.getString(25);
         this.titleText.mouseEnabled = false;
         this.titleText.mouseChildren = false;
         this.npcname.mouseEnabled = false;
         this.npcname.mouseChildren = false;
         this.detailstext.mouseEnabled = false;
         this.chohan.mouseEnabled = false;
         this.chohan.mouseChildren = false;
         this.§1t5438s0§.mouseEnabled = false;
         this.§1t5438s0§.mouseChildren = false;
         this.elementCircle.mouseEnabled = false;
         this.elementCircle.mouseChildren = false;
         this.kojuro.mouseEnabled = false;
         this.kojuro.mouseChildren = false;
      }
      
      public function show(param1:int, param2:int = 0, param3:§1t17s0§ = null) : *
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:§1t73s0§ = null;
         var _loc7_:Point = null;
         var _loc8_:§1t71s0§ = null;
         var _loc9_:int = 0;
         var _loc10_:String = null;
         var _loc11_:int = 0;
         this.uimode = param1;
         this.§1t5004s0§();
         this.visible = true;
         this.npcname.visible = false;
         this.crops.visible = false;
         this.money.visible = false;
         this.§1t5438s0§.visible = false;
         this.chohan.visible = false;
         this.kojuro.visible = false;
         this.§1t5864s0§.visible = false;
         this.elementCircle.visible = false;
         this.loading.visible = false;
         §1t406s0§.instance.§1t6590s0§(false);
         §1t6427s0§.§1t8196s0§(false);
         this.§1t5091s0§ = param3;
         if(!§1t1540s0§.§1t10014s0§())
         {
            §1t1541s0§.§1t10099s0§();
         }
         this.§1t5892s0§();
         this.money.§1t6662s0§(true);
         this.§1t5885s0§ = §1t1524s0§.§1t9893s0§(param1);
         this.§1t5877s0§ = 0;
         gotoAndStop(1);
         switch(param1)
         {
            case §1t12349s0§:
               this.titleText.label.text = §1t1521s0§.getString(2002);
               this.detailstext.text = §1t1521s0§.getString(2003);
               this.npcname.visible = true;
               this.npcname.nametext.text = §1t1521s0§.getString(5004);
               if(!§1t1523s0§.§1t9761s0§())
               {
                  this.§1t5438s0§.§1t5489s0§(104);
                  this.§1t5438s0§.§1t5492s0§();
                  this.§1t5438s0§.visible = true;
               }
               else
               {
                  this.kojuro.visible = true;
                  this.§1t5438s0§.visible = false;
               }
               this.money.visible = true;
               break;
            case §1t12353s0§:
               this.titleText.label.text = §1t1521s0§.getString(2012);
               this.detailstext.text = §1t1521s0§.getString(2013);
               this.npcname.visible = true;
               this.npcname.nametext.text = §1t1521s0§.getString(5018);
               this.§1t5438s0§.§1t5489s0§(52);
               this.§1t5438s0§.§1t5492s0§();
               this.§1t5438s0§.visible = true;
               this.money.visible = true;
               break;
            case §1t12350s0§:
               this.titleText.label.text = §1t1521s0§.getString(268);
               this.detailstext.text = "";
               this.money.visible = true;
               §1t3318s0§.instance.§1t3422s0§(this.§1t5888s0§);
               break;
            case §1t12351s0§:
               this.titleText.label.text = §1t1521s0§.getString(257);
               this.detailstext.text = "";
               this.crops.show(param2,this);
               break;
            case §1t12354s0§:
               this.titleText.label.text = §1t1521s0§.getString(511);
               _loc4_ = §1t70s0§.instance.§1t1139s0§(§1t1525s0§.§1t9935s0§()) * 2;
               this.detailstext.text = §1t1521s0§.getString(512);
               this.detailstext.appendText("\n" + §1t1521s0§.getString(528,[_loc4_]));
               this.npcname.visible = true;
               this.npcname.nametext.text = §1t1521s0§.getString(5060);
               this.§1t5438s0§.§1t5489s0§(§1t76s0§.§1t9198s0§);
               this.§1t5438s0§.§1t5492s0§();
               this.§1t5438s0§.visible = true;
               this.money.visible = true;
               break;
            case §1t12352s0§:
               this.titleText.label.text = §1t1521s0§.getString(525);
               _loc5_ = §1t70s0§.instance.§1t1139s0§(§1t1525s0§.§1t9935s0§()) * 2;
               this.detailstext.text = §1t1521s0§.getString(526);
               this.detailstext.appendText("\n" + §1t1521s0§.getString(528,[_loc5_]));
               this.npcname.visible = true;
               this.npcname.nametext.text = §1t1521s0§.getString(5061);
               this.§1t5438s0§.§1t5489s0§(51);
               this.§1t5438s0§.§1t5492s0§();
               this.§1t5438s0§.visible = true;
               this.money.visible = true;
               this.§1t5908s0§();
               return;
            case §1t12355s0§:
               this.titleText.label.text = §1t1521s0§.getString(4154);
               this.§1t5438s0§.§1t5490s0§();
               this.§1t5438s0§.§1t5492s0§();
               this.§1t5438s0§.visible = true;
               break;
            case §1t12356s0§:
               this.titleText.label.text = §1t1521s0§.getString(5062);
               this.detailstext.text = §1t1521s0§.getString(551);
               this.npcname.visible = true;
               this.npcname.nametext.text = §1t1521s0§.getString(5062);
               this.§1t5438s0§.§1t5489s0§(52);
               this.§1t5438s0§.§1t5492s0§();
               this.§1t5438s0§.visible = true;
               this.money.visible = true;
               break;
            case §1t12357s0§:
               this.titleText.label.text = §1t1521s0§.getString(552);
               this.detailstext.text = "";
               this.money.visible = false;
               break;
            case §1t12358s0§:
               this.titleText.label.text = §1t1521s0§.getString(553);
               this.detailstext.text = "";
               this.money.visible = true;
               this.bet = 0;
               break;
            case §1t12359s0§:
               this.titleText.label.text = §1t1521s0§.getString(559);
               if(!§1t1523s0§.§1t9762s0§())
               {
                  this.§1t5438s0§.§1t5489s0§(32);
                  this.§1t5438s0§.§1t5492s0§();
                  this.§1t5438s0§.visible = true;
                  this.detailstext.text = "";
               }
               else
               {
                  this.§1t5864s0§.visible = true;
                  this.§1t5864s0§.§1t5926s0§();
                  this.§1t5438s0§.visible = false;
               }
               this.money.visible = true;
               this.§1t5886s0§();
               this.money.§1t6662s0§(false);
               this.§1t5877s0§ = param2;
               break;
            case §1t12360s0§:
               this.titleText.label.text = §1t1521s0§.getString(559);
               if(!§1t1523s0§.§1t9762s0§())
               {
                  this.§1t5438s0§.§1t5489s0§(32);
                  this.§1t5438s0§.§1t5492s0§();
                  this.§1t5438s0§.visible = true;
                  this.detailstext.text = "";
               }
               else
               {
                  this.§1t5864s0§.visible = true;
                  this.§1t5864s0§.§1t5926s0§();
                  this.§1t5438s0§.visible = false;
               }
               this.money.visible = true;
               _loc6_ = new §1t73s0§(new XMLList());
               _loc6_.§1t842s0§();
               §1t406s0§.instance.§1t6518s0§.§1t6890s0§(_loc6_);
               §1t406s0§.instance.§1t6518s0§.§1t6893s0§();
               this.§1t5886s0§();
               this.money.§1t6662s0§(false);
               break;
            case §1t12361s0§:
               this.titleText.label.text = §1t1521s0§.getString(607);
               this.detailstext.text = §1t1521s0§.getString(608);
               break;
            case §1t12362s0§:
               this.titleText.label.text = §1t1521s0§.getString(5065);
               this.detailstext.text = §1t1521s0§.getString(2014);
               this.npcname.visible = true;
               this.npcname.nametext.text = §1t1521s0§.getString(5065);
               this.§1t5438s0§.§1t5489s0§(52);
               this.§1t5438s0§.§1t5492s0§();
               this.§1t5438s0§.visible = true;
               this.money.visible = true;
               break;
            case §1t12363s0§:
               gotoAndStop(2);
               this.detailstext.mouseWheelEnabled = false;
               this.titleText.label.text = §1t1521s0§.getString(743);
               _loc7_ = §1t70s0§.instance.§1t1133s0§(§1t1525s0§.§1t9935s0§());
               _loc8_ = §1t70s0§.instance.§1t1126s0§(_loc7_.x,_loc7_.y,false);
               _loc8_.§1t1349s0§();
               break;
            case §1t12365s0§:
               this.titleText.label.text = §1t1521s0§.getString(828);
               this.detailstext.text = §1t1521s0§.getString(829,[this.§1t5091s0§.§1t472s0§]);
               break;
            case §1t12366s0§:
               this.titleText.label.text = §1t1521s0§.getString(828);
               this.detailstext.text = §1t1521s0§.getString(830,[this.§1t5091s0§.§1t472s0§]);
               break;
            case §1t12367s0§:
               this.titleText.label.text = §1t1521s0§.getString(5013);
               this.npcname.nametext.text = §1t1521s0§.getString(5013);
               this.npcname.visible = true;
               this.§1t5438s0§.§1t5492s0§();
               this.§1t5438s0§.visible = true;
               this.money.visible = true;
               _loc7_ = §1t70s0§.instance.§1t1133s0§(§1t1525s0§.§1t9935s0§());
               _loc8_ = §1t70s0§.instance.§1t1126s0§(_loc7_.x,_loc7_.y,false);
               _loc9_ = _loc8_.§1t1342s0§();
               if(_loc9_ == 1)
               {
                  _loc10_ = §1t1521s0§.getString(275);
                  this.§1t5438s0§.§1t5489s0§(247);
               }
               else if(_loc9_ == 2)
               {
                  _loc10_ = §1t1521s0§.getString(276);
                  this.§1t5438s0§.§1t5489s0§(447);
               }
               else if(_loc9_ == 3)
               {
                  _loc10_ = §1t1521s0§.getString(277);
                  this.§1t5438s0§.§1t5489s0§(347);
               }
               else if(_loc9_ == 4)
               {
                  _loc10_ = §1t1521s0§.getString(278);
                  this.§1t5438s0§.§1t5489s0§(547);
               }
               else if(§1t1523s0§.§1t9663s0§(_loc9_))
               {
                  _loc10_ = _loc8_.§1t1278s0§;
                  this.§1t5438s0§.§1t5489s0§(647);
               }
               else
               {
                  _loc10_ = "us";
                  this.§1t5438s0§.§1t5489s0§(647);
               }
               if(param2 == 0)
               {
                  _loc11_ = §1t70s0§.instance.§1t1139s0§(§1t1525s0§.§1t9935s0§());
                  this.detailstext.text = §1t1521s0§.getString(879,[_loc8_.§1t1341s0§(),_loc10_,_loc11_]);
               }
               else
               {
                  this.detailstext.text = §1t1521s0§.getString(880,[_loc8_.§1t1341s0§()]);
                  this.§1t5877s0§ = 1;
               }
               break;
            case §1t12368s0§:
               this.titleText.label.text = §1t1521s0§.getString(859);
               if(§1t1523s0§.§1t9714s0§(40018) == 0)
               {
                  this.detailstext.text = §1t1521s0§.getString(11502);
               }
               else
               {
                  this.detailstext.text = "";
                  this.§1t5877s0§ = 1;
               }
         }
         this.§1t5887s0§();
         this.§1t5889s0§();
      }
      
      internal function §1t5886s0§() : *
      {
         var _loc1_:§1t8630s0§ = null;
         if(§1t1523s0§.§1t9393s0§.§1t697s0§() > 0 && §1t1523s0§.§1t9478s0§ && !this.§1t5883s0§)
         {
            §1t1712s0§.§1t4535s0§(§1t1525s0§.§1t9586s0§().§1t1555s0§() + 100,§1t1525s0§.§1t9586s0§().§1t1559s0§().y);
            _loc1_ = §1t1525s0§.§1t9940s0§().§1t3537s0§(3,§1t1525s0§.§1t9586s0§().§1t1555s0§() + 100,§1t1525s0§.§1t9586s0§().§1t1559s0§().y,"32,kneel,0,12",§1t1523s0§.charname + "ninjaservant",null,false) as §1t8630s0§;
            if(_loc1_ != null)
            {
               this.§1t5883s0§ = true;
            }
            §1t251s0§.instance.§1t3537s0§(3,§1t1525s0§.§1t9586s0§().§1t1555s0§() + 100,§1t1525s0§.§1t9586s0§().§1t1559s0§().y,"32,kneel,0,12",§1t1523s0§.charname + "ninjaservant");
            §1t251s0§.instance.§1t3539s0§(3,§1t1525s0§.§1t9586s0§().§1t1555s0§() + 100,§1t1525s0§.§1t9586s0§().§1t1559s0§().y,0,0,0,0);
         }
      }
      
      internal function §1t5887s0§(param1:§1t400s0§ = null) : *
      {
         var _loc7_:§1t766s0§ = null;
         this.actions.length = 0;
         if(param1 == null)
         {
            param1 = this.§1t5885s0§.§1t765s0§[this.§1t5877s0§];
         }
         var _loc2_:int = param1.§1t777s0§();
         var _loc3_:int = 0;
         var _loc4_:Boolean = false;
         var _loc5_:int = 0;
         while(_loc5_ < 6)
         {
            this.buttons[_loc5_].visible = false;
            _loc5_++;
         }
         var _loc6_:int = 0;
         _loc5_ = 0;
         while(_loc5_ < _loc2_)
         {
            _loc7_ = param1.§1t776s0§[_loc5_];
            _loc4_ = §1t1523s0§.§1t640s0§(_loc7_.condition);
            if(_loc5_ < _loc2_ && _loc4_)
            {
               _loc6_ = _loc7_.ap;
               this.buttons[_loc3_].visible = true;
               if(_loc6_ == 0)
               {
                  this.buttons[_loc3_].§1t5769s0§(§1t1521s0§.getString(_loc7_.label));
               }
               else
               {
                  this.buttons[_loc3_].§1t5769s0§(§1t1521s0§.getString(_loc7_.label),"",_loc6_);
               }
               if(_loc7_.icon != -1)
               {
                  this.buttons[_loc3_].§1t5767s0§(_loc7_.icon);
               }
               else
               {
                  this.buttons[_loc3_].§1t5768s0§();
               }
               this.actions[_loc3_] = _loc7_;
               _loc3_++;
            }
            _loc5_++;
         }
      }
      
      public function §1t5888s0§(param1:Array) : *
      {
         var _loc8_:int = 0;
         var _loc2_:int = int(param1.length);
         var _loc3_:int = int(param1[0]);
         var _loc4_:int = 0;
         var _loc5_:int = int(param1[0]);
         var _loc6_:* = 0;
         var _loc7_:int = 1;
         while(_loc7_ < _loc2_)
         {
            _loc8_ = int(param1[_loc7_]);
            if(_loc8_ > _loc3_)
            {
               _loc3_ = _loc8_;
               _loc4_ = _loc7_;
            }
            if(_loc8_ < _loc5_)
            {
               _loc5_ = _loc8_;
               _loc6_ = _loc7_;
            }
            _loc7_++;
         }
         this.§1t5884s0§ = [10,10,10,10];
         if(_loc3_ != _loc5_)
         {
            this.§1t5884s0§[_loc6_] = 20;
            this.§1t5884s0§[_loc4_] = 5;
         }
         if(this.uimode == §1t12350s0§ && this.§1t5877s0§ == 1)
         {
            this.§1t5889s0§();
         }
      }
      
      internal function §1t5889s0§() : *
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:§1t17s0§ = null;
         var _loc4_:int = 0;
         switch(this.uimode)
         {
            case §1t12349s0§:
            case §1t12351s0§:
            case §1t12353s0§:
            case §1t12354s0§:
            case §1t12352s0§:
            case §1t12361s0§:
            case §1t12365s0§:
            case §1t12366s0§:
               break;
            case §1t12350s0§:
               if(this.§1t5877s0§ == 1)
               {
                  _loc2_ = §1t1523s0§.§1t9714s0§(20040);
                  if(_loc2_ == 0)
                  {
                     this.detailstext.text = §1t1521s0§.getString(270);
                  }
                  else
                  {
                     this.detailstext.text = §1t1521s0§.getString(838,[§1t1523s0§.§1t9714s0§(20040)]) + "\n";
                  }
                  this.detailstext.appendText(§1t1521s0§.getString(275) + ": " + this.§1t5884s0§[0] + " " + §1t1521s0§.getString(63) + "/" + §1t1521s0§.getString(279) + "\n");
                  this.detailstext.appendText(§1t1521s0§.getString(276) + ": " + this.§1t5884s0§[1] + " " + §1t1521s0§.getString(63) + "/" + §1t1521s0§.getString(279) + "\n");
                  this.detailstext.appendText(§1t1521s0§.getString(277) + ": " + this.§1t5884s0§[2] + " " + §1t1521s0§.getString(63) + "/" + §1t1521s0§.getString(279) + "\n");
                  this.detailstext.appendText(§1t1521s0§.getString(278) + ": " + this.§1t5884s0§[3] + " " + §1t1521s0§.getString(63) + "/" + §1t1521s0§.getString(279) + "\n");
               }
               else
               {
                  this.detailstext.text = §1t1521s0§.getString(4162) + this.§1t5905s0§(0,§1t1523s0§.§1t9714s0§(20054));
                  this.detailstext.appendText("\n" + §1t1521s0§.getString(4163) + this.§1t5905s0§(1,§1t1523s0§.§1t9714s0§(20055)));
                  this.detailstext.appendText("\n" + §1t1521s0§.getString(4164) + this.§1t5905s0§(2,§1t1523s0§.§1t9714s0§(20056)));
                  this.detailstext.appendText("\n" + §1t1521s0§.getString(4165) + this.§1t5905s0§(3,§1t1523s0§.§1t9714s0§(20057)));
               }
               break;
            case §1t12355s0§:
               if(this.§1t5877s0§ == 0)
               {
                  this.detailstext.text = §1t1521s0§.getString(610);
               }
               else if(this.§1t5877s0§ == 1)
               {
                  this.detailstext.text = §1t1521s0§.getString(611);
                  this.elementCircle.visible = true;
               }
               break;
            case §1t12357s0§:
               break;
            case §1t12358s0§:
               if(this.§1t5877s0§ == 0)
               {
                  if(this.bet > 0)
                  {
                     §1t1523s0§.§1t9713s0§(§1t1523s0§.§1t9412s0§,this.bet);
                  }
                  this.bet = 0;
                  this.detailstext.text = "";
                  this.§1t5892s0§();
               }
               else if(this.§1t5877s0§ == 1 || this.§1t5877s0§ == 2)
               {
                  this.detailstext.text = §1t1521s0§.getString(613) + this.bet;
               }
               if(this.§1t5877s0§ == 2)
               {
                  if(this.bet == 0)
                  {
                     this.§1t5877s0§ = 1;
                     this.§1t5887s0§();
                  }
                  else
                  {
                     this.chohan.visible = true;
                     this.chohan.gotoAndStop(1);
                  }
               }
               break;
            case §1t12360s0§:
            case §1t12359s0§:
               if(this.§1t5877s0§ == 1)
               {
                  this.detailstext.text = §1t1521s0§.getString(609);
               }
               else if(this.§1t5877s0§ == 2)
               {
                  this.detailstext.text = §1t1521s0§.getString(615);
               }
               else if(this.§1t5877s0§ == 3)
               {
                  this.detailstext.text = §1t1521s0§.getString(636);
               }
               else if(this.§1t5877s0§ == 4)
               {
                  this.update(§1t3317s0§.instance.§1t1847s0§());
               }
               else if(§1t1523s0§.§1t9762s0§())
               {
                  this.detailstext.text = §1t1521s0§.getString(723);
               }
               else
               {
                  this.detailstext.text = "";
               }
               break;
            case §1t12362s0§:
               _loc1_ = §1t1525s0§.§1t9936s0§();
               if(_loc1_ > 80)
               {
                  _loc1_ = 80;
               }
               if(this.§1t5877s0§ == 0)
               {
                  this.detailstext.text = §1t1521s0§.getString(2014);
               }
               else if(this.§1t5877s0§ == 1)
               {
                  if(_loc1_ < 30)
                  {
                     this.detailstext.text = §1t1521s0§.getString(845,[_loc1_,_loc1_ * 100]);
                  }
                  else if(_loc1_ < 60)
                  {
                     this.detailstext.text = §1t1521s0§.getString(846,[_loc1_,_loc1_ * 100]);
                  }
                  else
                  {
                     this.detailstext.text = §1t1521s0§.getString(847,[_loc1_,_loc1_ * 100]);
                  }
               }
               else if(this.§1t5877s0§ == 2)
               {
                  this.detailstext.text = §1t1521s0§.getString(848,[_loc1_ * 10]);
               }
               else if(this.§1t5877s0§ == 3)
               {
                  _loc3_ = §1t1523s0§.§1t7316s0§[§1t1523s0§.§1t9448s0§];
                  if(_loc3_ == null || _loc3_.§1t483s0§() == 0 || _loc3_.§1t483s0§() == 13000)
                  {
                     this.detailstext.text = §1t1521s0§.getString(849);
                     return;
                  }
                  _loc4_ = _loc3_.getLevel();
                  if(_loc3_.§1t483s0§() == 13022)
                  {
                     _loc4_ = 59;
                  }
                  if(_loc4_ < 30)
                  {
                     this.detailstext.text = §1t1521s0§.getString(850);
                  }
                  else if(_loc4_ < 60)
                  {
                     this.detailstext.text = §1t1521s0§.getString(851);
                  }
                  else
                  {
                     this.detailstext.text = §1t1521s0§.getString(852);
                  }
               }
         }
      }
      
      public function update(param1:int) : *
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(!visible)
         {
            return;
         }
         if((this.uimode == §1t12360s0§ || this.uimode == §1t12359s0§) && this.§1t5877s0§ == 4)
         {
            _loc2_ = §1t1523s0§.§1t9714s0§(30018) - param1;
            if(_loc2_ <= 0)
            {
               if(this.detailstext.text != §1t1521s0§.getString(839))
               {
                  this.§1t5887s0§();
                  this.detailstext.text = §1t1521s0§.getString(839);
                  §1t3318s0§.instance.§1t3463s0§("d",false);
               }
            }
            else
            {
               this.detailstext.text = §1t1521s0§.getString(840,[this.§1t937s0§(_loc2_)]);
            }
            _loc3_ = §1t1523s0§.§1t9714s0§(30019);
            if(_loc2_ < -172800)
            {
               _loc3_ = 0;
            }
            if(_loc3_ == 1)
            {
               this.detailstext.appendText("\n\n" + §1t1521s0§.getString(841));
            }
            else
            {
               this.detailstext.appendText("\n\n" + §1t1521s0§.getString(842,[_loc3_]));
            }
            this.detailstext.appendText("\n" + §1t1521s0§.getString(843));
            this.detailstext.appendText("\n" + §1t1521s0§.getString(844));
         }
      }
      
      internal function §1t937s0§(param1:int) : String
      {
         var _loc6_:String = null;
         var _loc7_:String = null;
         var _loc2_:int = param1 % 60;
         var _loc3_:int = (param1 - _loc2_) / 60;
         var _loc4_:int = _loc3_ % 60;
         var _loc5_:int = (_loc3_ - _loc4_) / 60;
         if(_loc2_ < 10)
         {
            _loc6_ = "0" + _loc2_.toString();
         }
         else
         {
            _loc6_ = _loc2_.toString();
         }
         if(_loc4_ < 10)
         {
            _loc7_ = "0" + _loc4_.toString();
         }
         else
         {
            _loc7_ = _loc4_.toString();
         }
         if(_loc5_ == 0)
         {
            return _loc7_ + ":" + _loc6_;
         }
         return _loc5_ + ":" + _loc7_ + ":" + _loc6_;
      }
      
      internal function §1t5890s0§(param1:int) : *
      {
         var actionStr:String;
         var §1t1656s0§:§1t58s0§ = null;
         var §1t1173s0§:§1t73s0§ = null;
         var cost:int = 0;
         var weapon:§1t17s0§ = null;
         var clanId:int = 0;
         var hp:int = 0;
         var §1t3257s0§:int = 0;
         var chi:int = 0;
         var §1t4413s0§:int = 0;
         var ap:int = 0;
         var maxap:int = 0;
         var weaponlevel:int = 0;
         var num:int = param1;
         if(!§1t1523s0§.§1t640s0§(this.actions[num].condition))
         {
            §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(this.actions[num].§1t773s0§),§1t1521s0§.getString(5));
            §1t406s0§.instance.§1t6486s0§.§1t5486s0§();
            §1t88s0§.instance.§1t1516s0§("Snd_error");
            return;
         }
         if(!§1t1523s0§.§1t9606s0§(this.actions[num].ap))
         {
            §1t406s0§.instance.§1t6528s0§(§1t1521s0§.getString(100),§1t1521s0§.getString(5));
            §1t406s0§.instance.§1t6486s0§.§1t5486s0§();
            §1t88s0§.instance.§1t1516s0§("Snd_error");
            return;
         }
         §1t1656s0§ = §1t58s0§.§1t8804s0§(§1t1525s0§.§1t9935s0§() * §1t3317s0§.instance.§1t1848s0§());
         actionStr = this.actions[num].§1t775s0§();
         if(actionStr != "close" && actionStr != "harvest" && actionStr != "plant")
         {
            §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         }
         switch(actionStr)
         {
            case "goto":
               this.§1t5877s0§ = this.actions[num].§1t771s0§;
               this.§1t5887s0§();
               this.§1t5889s0§();
               break;
            case "close":
               this.hide();
               break;
            case §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9066s0§):
               if(§1t1523s0§.§1t9616s0§() < §1t70s0§.instance.§1t1139s0§(§1t1525s0§.§1t9935s0§()) * 2)
               {
                  §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(88),§1t1521s0§.getString(5));
                  §1t406s0§.instance.§1t6486s0§.§1t5486s0§();
                  §1t88s0§.instance.§1t1516s0§("Snd_error");
               }
               else
               {
                  §1t1523s0§.§1t9619s0§(-§1t70s0§.instance.§1t1139s0§(§1t1525s0§.§1t9935s0§()) * 2);
                  this.hide();
                  §1t406s0§.instance.§1t6496s0§.§1t6848s0§(§1t6497s0§.§1t12434s0§);
               }
               break;
            case §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9067s0§):
               §1t1173s0§ = new §1t73s0§(new XMLList());
               §1t1173s0§.§1t839s0§(§1t1656s0§);
               §1t406s0§.instance.§1t6518s0§.§1t6890s0§(§1t1173s0§);
               break;
            case §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9068s0§):
               §1t1173s0§ = new §1t73s0§(new XMLList());
               §1t406s0§.instance.§1t6518s0§.§1t6892s0§(§1t1173s0§);
               break;
            case §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9069s0§):
               §1t1173s0§ = new §1t73s0§(new XMLList());
               §1t3318s0§.instance.§1t3463s0§("m",true);
               §1t1173s0§.§1t841s0§();
               §1t406s0§.instance.§1t6518s0§.§1t6891s0§(§1t1173s0§);
               break;
            case §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9070s0§):
               §1t1173s0§ = new §1t73s0§(new XMLList());
               §1t406s0§.instance.§1t6518s0§.§1t6892s0§(§1t1173s0§);
               break;
            case §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9071s0§):
               §1t1173s0§ = new §1t73s0§(new XMLList());
               §1t1173s0§.§1t844s0§(§1t1656s0§);
               §1t406s0§.instance.§1t6518s0§.§1t6890s0§(§1t1173s0§);
               break;
            case §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9072s0§):
               §1t1173s0§ = new §1t73s0§(new XMLList());
               §1t1173s0§.§1t840s0§(§1t1656s0§);
               §1t406s0§.instance.§1t6518s0§.§1t6890s0§(§1t1173s0§);
               break;
            case §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9073s0§):
               this.§1t5903s0§(this.actions[num].§1t771s0§);
               break;
            case §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9074s0§):
               this.travel(this.actions[num].§1t771s0§);
               break;
            case §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9075s0§):
               this.crops.plant(this.actions[num].§1t771s0§);
               break;
            case §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9076s0§):
               this.crops.harvest();
               break;
            case §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9077s0§):
               this.§1t5906s0§(this.actions[num].§1t771s0§);
               break;
            case §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9078s0§):
               this.§1t5907s0§(this.actions[num].§1t771s0§);
               break;
            case §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9079s0§):
               if(§1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9426s0§) == 8)
               {
                  §1t1523s0§.§1t9713s0§(§1t1523s0§.§1t1235s0§,20);
               }
               else if(§1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9426s0§) < 8)
               {
                  §1t1523s0§.§1t9713s0§(§1t1523s0§.§1t1235s0§,10);
               }
               §1t1523s0§.§1t9713s0§(2202,-1);
               this.hide();
               §1t1523s0§.§1t9600s0§();
               break;
            case §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9080s0§):
               if(§1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9426s0§) == 8)
               {
                  §1t1523s0§.§1t9713s0§(§1t1523s0§.§1t1236s0§,20);
               }
               else if(§1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9426s0§) < 8)
               {
                  §1t1523s0§.§1t9713s0§(§1t1523s0§.§1t1236s0§,10);
               }
               §1t1523s0§.§1t9713s0§(2202,-1);
               this.hide();
               §1t1523s0§.§1t9600s0§();
               break;
            case §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9081s0§):
               if(§1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9426s0§) == 8)
               {
                  §1t1523s0§.§1t9713s0§(§1t1523s0§.§1t1237s0§,20);
               }
               else if(§1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9426s0§) < 8)
               {
                  §1t1523s0§.§1t9713s0§(§1t1523s0§.§1t1237s0§,10);
               }
               §1t1523s0§.§1t9713s0§(2202,-1);
               this.hide();
               §1t1523s0§.§1t9600s0§();
               break;
            case §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9082s0§):
               if(§1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9426s0§) == 8)
               {
                  §1t1523s0§.§1t9713s0§(§1t1523s0§.§1t1238s0§,20);
               }
               else if(§1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9426s0§) < 8)
               {
                  §1t1523s0§.§1t9713s0§(§1t1523s0§.§1t1238s0§,10);
               }
               §1t1523s0§.§1t9713s0§(2202,-1);
               this.hide();
               §1t1523s0§.§1t9600s0§();
               break;
            case §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8861s0§):
               this.§1t5913s0§(this.actions[num].§1t771s0§);
               break;
            case §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9083s0§):
               if(!§1t251s0§.instance.§1t3595s0§())
               {
                  §1t88s0§.instance.§1t1516s0§("Snd_error");
               }
               else
               {
                  this.loading.visible = true;
                  this.§1t5914s0§ = this.actions[num].§1t771s0§;
                  §1t251s0§.instance.§1t3547s0§(this.§1t5915s0§);
               }
               break;
            case §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9084s0§):
               §1t1173s0§ = new §1t73s0§(new XMLList());
               §1t1173s0§.§1t842s0§();
               §1t406s0§.instance.§1t6518s0§.§1t6890s0§(§1t1173s0§);
               §1t406s0§.instance.§1t6518s0§.§1t6893s0§();
               break;
            case §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9085s0§):
               if(!§1t1523s0§.§1t9618s0§())
               {
                  §1t1523s0§.§1t9615s0§(1,function():*
                  {
                     §1t88s0§.instance.§1t1516s0§("Snd_goodKoto");
                     §1t1523s0§.§1t9619s0§(200);
                     §1t3317s0§.instance.§1t1946s0§();
                     §1t5892s0§();
                     if(§1t412s0§.instance.visible)
                     {
                        §1t412s0§.instance.§1t6899s0§();
                     }
                     §1t3317s0§.instance.§1t1986s0§(4,"convertgold",1);
                  },function():*
                  {
                     §1t406s0§.instance.§1t6552s0§(1);
                  });
               }
               else
               {
                  §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(356),§1t1521s0§.getString(5));
                  §1t406s0§.instance.§1t6486s0§.§1t5486s0§();
                  §1t88s0§.instance.§1t1516s0§("Snd_error");
               }
               break;
            case §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9086s0§):
               §1t1523s0§.§1t9713s0§(2203,-1);
               this.hide();
               §1t1523s0§.§1t6525s0§();
               break;
            case §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9087s0§):
               clanId = this.§1t5091s0§.§1t523s0§(§1t1523s0§.§1t9422s0§);
               §1t1523s0§.§1t9712s0§(§1t1523s0§.§1t9422s0§,clanId);
               §1t1523s0§.§1t9712s0§(§1t1523s0§.§1t9424s0§,0);
               §1t1523s0§.§1t9712s0§(§1t1523s0§.§1t9425s0§,0);
               §1t3317s0§.instance.§1t1918s0§(-1,§1t1523s0§.charname);
               §1t406s0§.instance.§1t6526s0§();
               §1t1523s0§.§1t7692s0§(this.§1t5091s0§);
               this.§1t5877s0§ = 1;
               this.§1t5887s0§();
               §1t3318s0§.instance.§1t3432s0§(clanId,function():*
               {
                  hide();
                  var _loc1_:String = §1t3318s0§.instance.§1t3435s0§(clanId).clanname;
                  _loc1_ = _loc1_.substr(0,1).toUpperCase() + _loc1_.substr(1);
                  §1t251s0§.instance.§1t3524s0§("",901,[§1t1523s0§.§1t9765s0§(),§1t1521s0§.getString(563,[_loc1_])]);
               });
               break;
            case §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9088s0§):
               clanId = this.§1t5091s0§.§1t523s0§(§1t1523s0§.§1t9422s0§);
               §1t1523s0§.§1t9712s0§(§1t1523s0§.§1t9422s0§,clanId);
               §1t1523s0§.§1t9712s0§(§1t1523s0§.§1t9424s0§,2076);
               §1t1523s0§.§1t9712s0§(§1t1523s0§.§1t9425s0§,0);
               §1t3317s0§.instance.§1t1918s0§(-1,§1t1523s0§.charname);
               §1t406s0§.instance.§1t6526s0§();
               §1t1523s0§.§1t7692s0§(this.§1t5091s0§);
               this.§1t5877s0§ = 1;
               this.§1t5887s0§();
               §1t3318s0§.instance.§1t3432s0§(clanId,function():*
               {
                  hide();
                  var _loc1_:String = §1t3318s0§.instance.§1t3435s0§(clanId).clanname;
                  _loc1_ = _loc1_.substr(0,1).toUpperCase() + _loc1_.substr(1);
                  §1t251s0§.instance.§1t3524s0§("",901,[§1t1523s0§.§1t9765s0§(),§1t1521s0§.getString(563,[_loc1_])]);
               });
               break;
            case §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9089s0§):
               if(§1t1523s0§.§1t9613s0§() >= 10 && §1t251s0§.instance.§1t3595s0§())
               {
                  this.hide();
                  §1t406s0§.instance.§1t6504s0§.show(§1t5313s0§.§1t12346s0§);
               }
               else
               {
                  §1t406s0§.instance.§1t6552s0§(10);
               }
               break;
            case §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9090s0§):
               hp = §1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9402s0§);
               §1t3257s0§ = §1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9403s0§) + §1t1523s0§.§1t7358s0§(§1t1523s0§.§1t9403s0§);
               chi = §1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9405s0§);
               §1t4413s0§ = §1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9406s0§) + §1t1523s0§.§1t7358s0§(§1t1523s0§.§1t9406s0§);
               ap = §1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9414s0§);
               maxap = §1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9415s0§);
               if(hp < §1t3257s0§ || chi < §1t4413s0§ || ap < maxap)
               {
                  §1t1523s0§.§1t9615s0§(1,function():*
                  {
                     hide();
                     §1t406s0§.instance.§1t6496s0§.§1t6848s0§(§1t6497s0§.§1t12434s0§);
                     §1t3317s0§.instance.§1t1986s0§(0,"fullhpchi",1);
                  },function():*
                  {
                     §1t406s0§.instance.§1t6552s0§(1);
                  });
               }
               break;
            case §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9091s0§):
               if(!§1t251s0§.instance.§1t3595s0§())
               {
                  §1t88s0§.instance.§1t1516s0§("Snd_error");
                  break;
               }
               this.loading.visible = true;
               §1t251s0§.instance.§1t3547s0§(function():*
               {
                  §1t5916s0§(cost,§1t1656s0§);
               });
               return;
               break;
            case §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9092s0§):
               cost = §1t1525s0§.§1t9936s0§() * 10;
               if(§1t1523s0§.§1t9616s0§() < cost)
               {
                  §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(88),§1t1521s0§.getString(5));
                  §1t406s0§.instance.§1t6486s0§.§1t5486s0§();
                  §1t88s0§.instance.§1t1516s0§("Snd_error");
                  §1t1656s0§.destroy();
                  return;
               }
               weapon = §1t1523s0§.§1t7316s0§[§1t1523s0§.§1t9448s0§];
               if(weapon == null || weapon.§1t483s0§() == 0 || weapon.§1t483s0§() == 13000)
               {
                  §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(637),§1t1521s0§.getString(5));
                  §1t406s0§.instance.§1t6486s0§.§1t5486s0§();
                  §1t88s0§.instance.§1t1516s0§("Snd_error");
                  §1t1656s0§.destroy();
                  return;
               }
               §1t1523s0§.§1t9619s0§(-cost);
               if(weapon.uses > 1)
               {
                  weapon.uses = 1;
               }
               §1t1523s0§.§1t1684s0§(60005,1);
               §1t3317s0§.instance.§1t1530s0§(§1t1523s0§.§1t9675s0§);
               §1t3317s0§.instance.§1t1946s0§();
               this.hide();
               break;
            case §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9093s0§):
               cost = 5000;
               if(§1t1523s0§.§1t9616s0§() < cost)
               {
                  §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(88),§1t1521s0§.getString(5));
                  §1t406s0§.instance.§1t6486s0§.§1t5486s0§();
                  §1t88s0§.instance.§1t1516s0§("Snd_error");
                  §1t1656s0§.destroy();
                  return;
               }
               weapon = §1t1523s0§.§1t7316s0§[§1t1523s0§.§1t9448s0§];
               if(weapon == null || weapon.§1t483s0§() == 0 || weapon.§1t483s0§() == 13000)
               {
                  §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(637),§1t1521s0§.getString(5));
                  §1t406s0§.instance.§1t6486s0§.§1t5486s0§();
                  §1t88s0§.instance.§1t1516s0§("Snd_error");
                  §1t1656s0§.destroy();
                  return;
               }
               weaponlevel = weapon.getLevel();
               if(weapon.§1t483s0§() == 13022)
               {
                  weaponlevel = 59;
               }
               if(weaponlevel < 30)
               {
                  if(§1t1523s0§.§1t9714s0§(20064) == 0)
                  {
                     §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(666),§1t1521s0§.getString(5));
                     §1t406s0§.instance.§1t6486s0§.§1t5486s0§();
                     §1t88s0§.instance.§1t1516s0§("Snd_error");
                     §1t1656s0§.destroy();
                     return;
                  }
                  §1t1523s0§.§1t9713s0§(20064,-1);
               }
               else if(weaponlevel < 60)
               {
                  if(§1t1523s0§.§1t9714s0§(20065) == 0)
                  {
                     §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(666),§1t1521s0§.getString(5));
                     §1t406s0§.instance.§1t6486s0§.§1t5486s0§();
                     §1t88s0§.instance.§1t1516s0§("Snd_error");
                     §1t1656s0§.destroy();
                     return;
                  }
                  §1t1523s0§.§1t9713s0§(20065,-1);
               }
               else
               {
                  if(§1t1523s0§.§1t9714s0§(20066) == 0)
                  {
                     §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(666),§1t1521s0§.getString(5));
                     §1t406s0§.instance.§1t6486s0§.§1t5486s0§();
                     §1t88s0§.instance.§1t1516s0§("Snd_error");
                     §1t1656s0§.destroy();
                     return;
                  }
                  §1t1523s0§.§1t9713s0§(20066,-1);
               }
               §1t1523s0§.§1t9619s0§(-cost);
               weapon.uses = 0;
               weapon.§1t541s0§(§1t1523s0§.§1t9765s0§());
               §1t3317s0§.instance.§1t1530s0§(§1t1523s0§.§1t9675s0§);
               §1t3317s0§.instance.§1t1946s0§();
               this.hide();
               break;
            case §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9094s0§):
               if(!§1t251s0§.instance.§1t3595s0§())
               {
                  §1t88s0§.instance.§1t1516s0§("Snd_error");
               }
               else
               {
                  this.loading.visible = true;
                  §1t251s0§.instance.§1t3544s0§();
               }
               break;
            case §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8839s0§):
               this.hide();
               §1t406s0§.instance.§1t6504s0§.show(§1t5313s0§.§1t12347s0§);
               break;
            case §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9095s0§):
               §1t406s0§.instance.§1t6548s0§();
               break;
            case §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9096s0§):
               §1t406s0§.instance.§1t6550s0§();
               break;
            case §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9097s0§):
               §1t406s0§.instance.§1t6567s0§(null);
               break;
            case §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9098s0§):
               if(this.detailstext.scrollV >= this.detailstext.maxScrollV)
               {
                  this.detailstext.scrollV = 0;
               }
               else
               {
                  this.detailstext.scrollV += 10;
               }
               break;
            case §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9099s0§):
               cost = §1t70s0§.instance.§1t1139s0§(§1t1525s0§.§1t9935s0§());
               if(§1t1523s0§.§1t9616s0§() < cost)
               {
                  §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(88),§1t1521s0§.getString(5));
                  §1t406s0§.instance.§1t6486s0§.§1t5486s0§();
                  §1t88s0§.instance.§1t1516s0§("Snd_error");
                  §1t1656s0§.destroy();
                  return;
               }
               §1t1523s0§.§1t9619s0§(-cost);
            case §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9100s0§):
               this.hide();
               §1t406s0§.§1t9190s0§().§1t6496s0§.§1t6852s0§(§1t1525s0§.§1t9935s0§(),1);
               §1t406s0§.§1t9190s0§().§1t6496s0§.§1t6848s0§(§1t6497s0§.§1t12486s0§);
               break;
            case §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9101s0§):
               §1t406s0§.instance.§1t6527s0§("Coming soon!",§1t1521s0§.getString(5));
               §1t406s0§.instance.§1t6486s0§.§1t5486s0§();
               §1t88s0§.instance.§1t1516s0§("Snd_error");
               §1t1656s0§.destroy();
               return;
            case §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9102s0§):
               this.hide();
               §1t406s0§.instance.§1t6571s0§();
         }
         §1t1656s0§.destroy();
      }
      
      public function §1t5891s0§() : *
      {
         var _loc1_:int = 37 + this.§1t5864s0§.getLevel();
         var _loc2_:int = Math.random() * _loc1_;
         if(_loc2_ <= 4)
         {
            §1t406s0§.instance.§1t6488s0§.§1t5846s0§(100);
         }
         else if(_loc2_ == 5)
         {
            §1t406s0§.instance.§1t6488s0§.§1t5846s0§(200);
         }
         else if(_loc2_ == 6)
         {
            §1t406s0§.instance.§1t6488s0§.§1t5846s0§(300);
         }
         else if(_loc2_ == 7)
         {
            §1t406s0§.instance.§1t6488s0§.§1t6194s0§(§1t1523s0§.getLevel(),true,true);
         }
         else if(_loc2_ == 8)
         {
            §1t406s0§.instance.§1t6488s0§.§1t6186s0§(2115,1);
         }
         else if(_loc2_ == 9)
         {
            §1t406s0§.instance.§1t6488s0§.§1t6186s0§(2116,1);
         }
         else if(_loc2_ == 10)
         {
            §1t406s0§.instance.§1t6488s0§.§1t6186s0§(2117,1);
         }
         else if(_loc2_ == 11)
         {
            §1t406s0§.instance.§1t6488s0§.§1t6186s0§(2118,1);
         }
         else if(_loc2_ == 12)
         {
            §1t406s0§.instance.§1t6488s0§.§1t6186s0§(2140,1);
         }
         else if(_loc2_ == 13)
         {
            §1t406s0§.instance.§1t6488s0§.§1t6186s0§(2141,1);
         }
         else if(_loc2_ == 14)
         {
            §1t406s0§.instance.§1t6488s0§.§1t6186s0§(2119,1);
         }
         else if(_loc2_ == 15)
         {
            §1t406s0§.instance.§1t6488s0§.§1t6186s0§(2120,1);
         }
         else if(_loc2_ == 16)
         {
            §1t406s0§.instance.§1t6488s0§.§1t6186s0§(2100,1);
         }
         else if(_loc2_ == 17)
         {
            §1t406s0§.instance.§1t6488s0§.§1t6186s0§(2125,1);
         }
         else if(_loc2_ == 18)
         {
            §1t406s0§.instance.§1t6488s0§.§1t6186s0§(2103,1);
         }
         else if(_loc2_ == 19)
         {
            §1t406s0§.instance.§1t6488s0§.§1t6186s0§(2104,1);
         }
         else if(_loc2_ == 20)
         {
            §1t406s0§.instance.§1t6488s0§.§1t6186s0§(2105,1);
         }
         else if(_loc2_ == 21)
         {
            §1t406s0§.instance.§1t6488s0§.§1t6186s0§(2106,1);
         }
         else if(_loc2_ == 22)
         {
            §1t406s0§.instance.§1t6488s0§.§1t6186s0§(2107,1);
         }
         else if(_loc2_ == 23)
         {
            §1t406s0§.instance.§1t6488s0§.§1t6186s0§(2108,1);
         }
         else if(_loc2_ == 24)
         {
            §1t406s0§.instance.§1t6488s0§.§1t6186s0§(2109,1);
         }
         else if(_loc2_ == 25)
         {
            §1t406s0§.instance.§1t6488s0§.§1t6186s0§(2110,1);
         }
         else if(_loc2_ == 26)
         {
            §1t406s0§.instance.§1t6488s0§.§1t6186s0§(2111,1);
         }
         else if(_loc2_ == 27)
         {
            §1t406s0§.instance.§1t6488s0§.§1t6186s0§(2112,1);
         }
         else if(_loc2_ == 28)
         {
            §1t406s0§.instance.§1t6488s0§.§1t6186s0§(2113,1);
         }
         else if(_loc2_ == 29)
         {
            §1t406s0§.instance.§1t6488s0§.§1t6186s0§(2114,1);
         }
         else if(_loc2_ == 30)
         {
            §1t406s0§.instance.§1t6488s0§.§1t6186s0§(2128,1);
         }
         else if(_loc2_ == 31)
         {
            §1t406s0§.instance.§1t6488s0§.§1t6186s0§(20054,1);
         }
         else if(_loc2_ == 32)
         {
            §1t406s0§.instance.§1t6488s0§.§1t6186s0§(20055,1);
         }
         else if(_loc2_ == 33)
         {
            §1t406s0§.instance.§1t6488s0§.§1t6186s0§(20056,1);
         }
         else if(_loc2_ == 34)
         {
            §1t406s0§.instance.§1t6488s0§.§1t6186s0§(20057,1);
         }
         else if(_loc2_ == 35)
         {
            §1t406s0§.instance.§1t6488s0§.§1t6186s0§(2216,1);
         }
         else if(_loc2_ == 36)
         {
            §1t406s0§.instance.§1t6488s0§.§1t6186s0§(20112,1);
         }
         else if(_loc2_ == 37 || _loc2_ == 38 || _loc2_ == 39 || _loc2_ == 40 || _loc2_ == 41)
         {
            §1t406s0§.instance.§1t6488s0§.§1t6194s0§(§1t1523s0§.getLevel(),true,true,true);
         }
      }
      
      public function §1t5892s0§() : *
      {
         this.money.§1t6660s0§();
      }
      
      public function hide() : *
      {
         if(!visible)
         {
            return;
         }
         §1t88s0§.instance.§1t1516s0§("Snd_back");
         if(§1t12351s0§)
         {
            this.crops.hide();
         }
         this.removeEventListeners();
         this.visible = false;
         this.§1t5091s0§ = null;
         §1t3317s0§.instance.§1t1946s0§();
         if(§1t412s0§.instance.visible)
         {
            §1t412s0§.instance.§1t7618s0§();
         }
         else
         {
            §1t406s0§.instance.§1t6590s0§(true);
            §1t407s0§.instance.visible = true;
            if(§1t1540s0§.§1t10047s0§())
            {
               §1t1541s0§.§1t10097s0§();
               §1t406s0§.instance.§1t6592s0§();
            }
            else if(!§1t1540s0§.§1t10014s0§())
            {
               §1t406s0§.instance.§1t6610s0§();
               §1t1541s0§.§1t10045s0§();
            }
            else
            {
               §1t6427s0§.§1t8196s0§(true);
            }
            if(this.§1t5883s0§)
            {
               §1t1712s0§.§1t4535s0§(§1t1525s0§.§1t9586s0§().§1t1555s0§() + 100,§1t1525s0§.§1t9586s0§().§1t1559s0§().y);
               §1t1525s0§.§1t9940s0§().§1t8138s0§(§1t1523s0§.charname + "ninjaservant");
               this.§1t5883s0§ = false;
               §1t251s0§.instance.§1t3538s0§(§1t1523s0§.charname + "ninjaservant");
               §1t251s0§.instance.§1t3539s0§(3,§1t1525s0§.§1t9586s0§().§1t1555s0§() + 100,§1t1525s0§.§1t9586s0§().§1t1559s0§().y,0,0,0,0);
            }
         }
      }
      
      public function §1t5004s0§() : *
      {
         this.button1.addEventListener(MouseEvent.CLICK,this.§1t5893s0§);
         this.button2.addEventListener(MouseEvent.CLICK,this.§1t5894s0§);
         this.button3.addEventListener(MouseEvent.CLICK,this.§1t5895s0§);
         this.button4.addEventListener(MouseEvent.CLICK,this.§1t5896s0§);
         this.button5.addEventListener(MouseEvent.CLICK,this.§1t5897s0§);
         this.button6.addEventListener(MouseEvent.CLICK,this.§1t5898s0§);
         this.money.§1t6658s0§.addEventListener(MouseEvent.CLICK,this.§1t5899s0§);
         this.money.§1t5776s0§.addEventListener(MouseEvent.CLICK,this.§1t5900s0§);
         this.§1t5864s0§.§1t5917s0§.addEventListener(MouseEvent.CLICK,this.§1t5901s0§);
         this.§1t5864s0§.rightButton.addEventListener(MouseEvent.CLICK,this.§1t5902s0§);
      }
      
      public function removeEventListeners() : *
      {
         this.button1.removeEventListener(MouseEvent.CLICK,this.§1t5893s0§);
         this.button2.removeEventListener(MouseEvent.CLICK,this.§1t5894s0§);
         this.button3.removeEventListener(MouseEvent.CLICK,this.§1t5895s0§);
         this.button4.removeEventListener(MouseEvent.CLICK,this.§1t5896s0§);
         this.button5.removeEventListener(MouseEvent.CLICK,this.§1t5897s0§);
         this.button6.removeEventListener(MouseEvent.CLICK,this.§1t5898s0§);
         this.money.§1t6658s0§.removeEventListener(MouseEvent.CLICK,this.§1t5899s0§);
         this.money.§1t5776s0§.removeEventListener(MouseEvent.CLICK,this.§1t5900s0§);
         this.§1t5864s0§.§1t5917s0§.removeEventListener(MouseEvent.CLICK,this.§1t5901s0§);
         this.§1t5864s0§.rightButton.removeEventListener(MouseEvent.CLICK,this.§1t5902s0§);
      }
      
      internal function §1t5893s0§(param1:Event) : *
      {
         this.§1t5890s0§(0);
      }
      
      internal function §1t5894s0§(param1:Event) : *
      {
         this.§1t5890s0§(1);
      }
      
      internal function §1t5895s0§(param1:Event) : *
      {
         this.§1t5890s0§(2);
      }
      
      internal function §1t5896s0§(param1:Event) : *
      {
         this.§1t5890s0§(3);
      }
      
      internal function §1t5897s0§(param1:Event) : *
      {
         this.§1t5890s0§(4);
      }
      
      internal function §1t5898s0§(param1:Event) : *
      {
         this.§1t5890s0§(5);
      }
      
      internal function §1t5899s0§(param1:Event) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_click");
         this.hide();
         this.show(§1t401s0§.§1t12359s0§);
      }
      
      internal function §1t5900s0§(param1:Event) : *
      {
         this.hide();
         if(§1t412s0§.instance.visible)
         {
            §1t406s0§.instance.§1t6498s0§.show();
         }
         else
         {
            §1t406s0§.instance.§1t6553s0§(null);
         }
      }
      
      internal function §1t5901s0§(param1:Event) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         var _loc2_:int = this.§1t5864s0§.§1t5929s0§();
         this.§1t5864s0§.§1t5930s0§(--_loc2_);
      }
      
      internal function §1t5902s0§(param1:Event) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         var _loc2_:int = this.§1t5864s0§.§1t5929s0§();
         this.§1t5864s0§.§1t5930s0§(++_loc2_);
      }
      
      public function §1t3544s0§() : *
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(!this.loading.visible)
         {
            return;
         }
         this.loading.visible = false;
         §1t88s0§.instance.§1t1513s0§();
         var _loc1_:int = §1t1523s0§.§1t9714s0§(30018) - §1t3317s0§.instance.§1t1847s0§();
         if(_loc1_ <= 0)
         {
            _loc2_ = 1;
            if(_loc1_ >= -172800)
            {
               _loc2_ = §1t1523s0§.§1t9713s0§(30019,1);
            }
            else
            {
               §1t1523s0§.§1t9712s0§(30019,1);
            }
            §1t1523s0§.§1t9712s0§(30018,§1t3317s0§.instance.§1t1847s0§() + 24 * 60 * 60);
            if(_loc2_ > 1 && (_loc2_ - 1) % 30 == 0)
            {
               if(§1t1523s0§.§1t9517s0§)
               {
                  §1t3317s0§.instance.§1t1982s0§(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8899s0§));
                  return;
               }
               §1t1523s0§.§1t9517s0§ = true;
               _loc4_ = Math.random() * 10;
               if(_loc4_ == 0)
               {
                  _loc3_ = 2130;
               }
               else if(_loc4_ == 1)
               {
                  _loc3_ = 2131;
               }
               else if(_loc4_ == 2)
               {
                  _loc3_ = 2132;
               }
               else if(_loc4_ == 3)
               {
                  _loc3_ = 2133;
               }
               else if(_loc4_ == 4)
               {
                  _loc3_ = 2135;
               }
               else if(_loc4_ == 5)
               {
                  _loc3_ = 2136;
               }
               else if(_loc4_ == 6)
               {
                  _loc3_ = 2137;
               }
               else if(_loc4_ == 7)
               {
                  _loc3_ = 2138;
               }
               else if(_loc4_ == 8)
               {
                  _loc3_ = 2139;
               }
               else if(_loc4_ == 9)
               {
                  _loc3_ = 2146;
               }
               §1t406s0§.instance.§1t6488s0§.§1t6186s0§(_loc3_,1);
               §1t1523s0§.§1t1684s0§(60015,1);
               §1t251s0§.instance.§1t3524s0§("",862,[§1t1523s0§.§1t9765s0§()]);
            }
            else if(_loc2_ > 1 && (_loc2_ - 1) % 10 == 0)
            {
               if(§1t1523s0§.§1t9517s0§)
               {
                  §1t3317s0§.instance.§1t1982s0§(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8900s0§));
                  return;
               }
               §1t1523s0§.§1t9517s0§ = true;
               _loc4_ = Math.random() * 8;
               if(_loc4_ == 0)
               {
                  §1t406s0§.instance.§1t6488s0§.§1t5846s0§(1000);
               }
               else if(_loc4_ == 1)
               {
                  §1t406s0§.instance.§1t6488s0§.§1t6186s0§(2101,1);
               }
               else if(_loc4_ == 2)
               {
                  §1t406s0§.instance.§1t6488s0§.§1t6186s0§(2105,1);
               }
               else if(_loc4_ == 3)
               {
                  §1t406s0§.instance.§1t6488s0§.§1t6186s0§(2126,1);
               }
               else if(_loc4_ == 4)
               {
                  §1t406s0§.instance.§1t6488s0§.§1t6186s0§(2127,1);
               }
               else if(_loc4_ == 5)
               {
                  §1t406s0§.instance.§1t6488s0§.§1t6186s0§(20112,5);
               }
               else if(_loc4_ == 6)
               {
                  §1t406s0§.instance.§1t6488s0§.§1t6194s0§(§1t1523s0§.getLevel(),true,true,true);
               }
               else if(_loc4_ == 7)
               {
                  §1t406s0§.instance.§1t6488s0§.§1t6186s0§(2193,1);
               }
               §1t251s0§.instance.§1t3524s0§("",861,[§1t1523s0§.§1t9765s0§()]);
            }
            else
            {
               this.§1t5891s0§();
            }
            this.hide();
            §1t406s0§.instance.§1t6488s0§.§1t5826s0§();
            §1t406s0§.instance.§1t6488s0§.show();
         }
      }
      
      internal function §1t5903s0§(param1:int) : *
      {
         var _loc2_:int = int(this.§1t5884s0§[param1]);
         var _loc3_:int = §1t1523s0§.§1t9714s0§(20040);
         §1t406s0§.instance.§1t6488s0§.§1t5846s0§(_loc3_ * _loc2_);
         §1t1523s0§.§1t9712s0§(20040,0);
         §1t3317s0§.instance.§1t1946s0§();
         this.hide();
         §1t3317s0§.instance.§1t1955s0§(50000 + param1,_loc3_);
         §1t406s0§.instance.§1t6489s0§.show();
         §1t406s0§.instance.§1t6488s0§.§1t5826s0§();
         §1t406s0§.instance.§1t6488s0§.show();
      }
      
      internal function §1t5904s0§(param1:int) : int
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         switch(param1)
         {
            case 0:
               _loc2_ = 10;
               _loc3_ = 20;
               break;
            case 1:
               _loc2_ = 20;
               _loc3_ = 30;
               break;
            case 2:
               _loc2_ = 100;
               _loc3_ = 15;
               break;
            case 3:
               _loc2_ = 200;
               _loc3_ = 30;
               break;
            case 4:
               _loc2_ = 200;
               _loc3_ = 30;
               break;
            default:
               return 0;
         }
         var _loc4_:int = §1t3317s0§.instance.§1t1848s0§() * param1;
         return _loc2_ * (100 - _loc3_ / 2 + §1t58s0§.random(_loc3_,_loc4_)) / 100;
      }
      
      internal function §1t5905s0§(param1:int, param2:int) : String
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         switch(param1)
         {
            case 0:
               _loc3_ = 10;
               _loc4_ = 20;
               break;
            case 1:
               _loc3_ = 20;
               _loc4_ = 30;
               break;
            case 2:
               _loc3_ = 100;
               _loc4_ = 15;
               break;
            case 3:
               _loc3_ = 200;
               _loc4_ = 30;
               break;
            case 4:
               _loc3_ = 200;
               _loc4_ = 30;
         }
         var _loc5_:int = §1t3317s0§.instance.§1t1848s0§() * param1;
         var _loc6_:int = _loc3_ * (100 - _loc4_ / 2 + §1t58s0§.random(_loc4_,_loc5_)) / 100;
         return " " + §1t1521s0§.getString(527,[param2,_loc6_]);
      }
      
      internal function §1t5906s0§(param1:int) : *
      {
         var _loc2_:int = 0;
         if(§1t1523s0§.§1t9616s0§() < this.§1t5904s0§(param1))
         {
            §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(88),§1t1521s0§.getString(5));
            §1t406s0§.instance.§1t6486s0§.§1t5486s0§();
            return;
         }
         switch(param1)
         {
            case 0:
               §1t1523s0§.§1t9713s0§(20054,1);
               break;
            case 1:
               §1t1523s0§.§1t9713s0§(20055,1);
               break;
            case 2:
               §1t1523s0§.§1t9713s0§(20056,1);
               break;
            case 3:
               §1t1523s0§.§1t9713s0§(20057,1);
               break;
            case 4:
               §1t1523s0§.§1t9713s0§(20058,1);
         }
         §1t1523s0§.§1t9619s0§(-this.§1t5904s0§(param1));
         this.§1t5892s0§();
         this.§1t5889s0§();
         §1t1523s0§.§1t1684s0§(60024,-this.§1t5904s0§(param1));
      }
      
      internal function §1t5907s0§(param1:int) : *
      {
         switch(param1)
         {
            case 0:
               §1t1523s0§.§1t9713s0§(20054,-1);
               break;
            case 1:
               §1t1523s0§.§1t9713s0§(20055,-1);
               break;
            case 2:
               §1t1523s0§.§1t9713s0§(20056,-1);
               break;
            case 3:
               §1t1523s0§.§1t9713s0§(20057,-1);
               break;
            case 4:
               §1t1523s0§.§1t9713s0§(20058,-1);
         }
         §1t1523s0§.§1t9619s0§(this.§1t5904s0§(param1));
         this.§1t5892s0§();
         this.§1t5887s0§();
         this.§1t5889s0§();
         if(§1t1523s0§.§1t9714s0§(60024) < 5000)
         {
            §1t1523s0§.§1t1684s0§(60024,this.§1t5904s0§(param1));
         }
      }
      
      internal function §1t5908s0§() : *
      {
         var _loc2_:int = 0;
         var _loc4_:§1t71s0§ = null;
         var _loc1_:String = "<menu>";
         var _loc3_:Array = §1t70s0§.instance.§1t1128s0§();
         var _loc5_:Array = new Array();
         var _loc6_:int = 0;
         while(_loc6_ < 4)
         {
            _loc4_ = _loc3_[_loc6_];
            if(_loc4_.§1t1295s0§() && _loc4_.§1t1293s0§())
            {
               _loc1_ += "<option><label>95</label><icon>7</icon><action><id>" + §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9074s0§) + "</id><param>" + _loc4_.§1t1319s0§() + "</param></action></option>";
               if(_loc6_ == 0)
               {
                  _loc5_.push(_loc4_.§1t1341s0§() + " (N)");
               }
               else if(_loc6_ == 1)
               {
                  _loc5_.push(_loc4_.§1t1341s0§() + " (W)");
               }
               else if(_loc6_ == 2)
               {
                  _loc5_.push(_loc4_.§1t1341s0§() + " (E)");
               }
               else if(_loc6_ == 3)
               {
                  _loc5_.push(_loc4_.§1t1341s0§() + " (S)");
               }
            }
            _loc6_++;
         }
         _loc1_ += "<option><label>85</label><icon>14</icon><action><id>close</id></action></option></menu>";
         var _loc7_:§1t400s0§ = new §1t400s0§(XML(_loc1_));
         this.§1t5887s0§(_loc7_);
         var _loc8_:int = int(_loc5_.length);
         _loc6_ = 0;
         while(_loc6_ < _loc8_)
         {
            this.buttons[_loc6_].§1t5769s0§(_loc5_[_loc6_],"",5);
            _loc6_++;
         }
      }
      
      internal function travel(param1:int) : *
      {
         var _loc2_:int = §1t70s0§.instance.§1t1139s0§(§1t1525s0§.§1t9935s0§()) * 2;
         if(§1t1523s0§.§1t9616s0§() < _loc2_)
         {
            §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(88),§1t1521s0§.getString(5));
            §1t406s0§.instance.§1t6486s0§.§1t5486s0§();
            return;
         }
         if(§1t1523s0§.§1t9595s0§() > §1t1523s0§.§1t9603s0§())
         {
            §1t406s0§.instance.§1t6534s0§(§1t1521s0§.getString(138),§1t1521s0§.getString(5));
            §1t406s0§.instance.§1t6486s0§.§1t5486s0§();
            return;
         }
         if(!§1t1523s0§.§1t9606s0§(5))
         {
            §1t406s0§.instance.§1t6528s0§(§1t1521s0§.getString(100),§1t1521s0§.getString(5));
            §1t406s0§.instance.§1t6486s0§.§1t5486s0§();
            return;
         }
         this.hide();
         §1t1523s0§.§1t9619s0§(-_loc2_);
         §1t406s0§.§1t9190s0§().§1t6496s0§.§1t6852s0§(param1);
         §1t406s0§.§1t9190s0§().§1t6496s0§.§1t6848s0§(§1t6497s0§.§1t12486s0§);
      }
      
      internal function §1t5910s0§(param1:int) : *
      {
         var _loc2_:int = §1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9412s0§);
         var _loc3_:int = §1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9429s0§);
         if(param1 <= _loc2_)
         {
            §1t1523s0§.§1t9713s0§(§1t1523s0§.§1t9429s0§,param1);
            §1t1523s0§.§1t9713s0§(§1t1523s0§.§1t9412s0§,-param1);
         }
         else if(param1 > _loc2_)
         {
            §1t1523s0§.§1t9713s0§(§1t1523s0§.§1t9429s0§,_loc2_);
            §1t1523s0§.§1t9712s0§(§1t1523s0§.§1t9412s0§,0);
         }
         this.§1t5892s0§();
         this.§1t5889s0§();
      }
      
      internal function §1t5911s0§(param1:int) : *
      {
         var _loc2_:int = §1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9412s0§);
         var _loc3_:int = §1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9429s0§);
         var _loc4_:int = §1t1523s0§.§1t9617s0§();
         if(param1 > _loc3_)
         {
            param1 = _loc3_;
         }
         _loc2_ += param1;
         _loc3_ -= param1;
         var _loc5_:int = 0;
         if(_loc2_ > _loc4_)
         {
            _loc5_ = _loc2_ - _loc4_;
            _loc2_ = _loc4_;
            _loc3_ += _loc5_;
         }
         §1t1523s0§.§1t9712s0§(§1t1523s0§.§1t9429s0§,_loc3_);
         §1t1523s0§.§1t9712s0§(§1t1523s0§.§1t9412s0§,_loc2_);
         this.§1t5892s0§();
         this.§1t5889s0§();
      }
      
      internal function §1t5913s0§(param1:int) : *
      {
         var _loc2_:int = §1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9412s0§);
         if(param1 <= _loc2_)
         {
            this.bet += param1;
            §1t1523s0§.§1t9713s0§(§1t1523s0§.§1t9412s0§,-param1);
            this.§1t5892s0§();
            this.§1t5889s0§();
         }
      }
      
      internal function §1t5915s0§() : *
      {
         if(!this.loading.visible)
         {
            return;
         }
         this.loading.visible = false;
         this.§1t5877s0§ = 1;
         this.§1t5887s0§();
         this.§1t5889s0§();
         if(this.bet == 0)
         {
            return;
         }
         var _loc1_:int = Math.random() * 6 + 1;
         var _loc2_:int = Math.random() * 6 + 1;
         this.chohan.dice1.gotoAndStop(_loc1_);
         this.chohan.dice2.gotoAndStop(_loc2_);
         this.chohan.dice1.x = 70 + Math.random() * 60;
         this.chohan.dice1.y = 70 + Math.random() * 120;
         this.chohan.dice2.x = 70 + 60 + Math.random() * 60;
         this.chohan.dice2.y = 70 + Math.random() * 120;
         this.chohan.dice1.rotation = Math.random() * 360;
         this.chohan.dice2.rotation = Math.random() * 360;
         this.chohan.gotoAndPlay(2);
         this.detailstext.text = "";
         var _loc3_:Boolean = (_loc1_ + _loc2_) % 2 == 0;
         if(_loc3_)
         {
            this.detailstext.appendText(§1t1521s0§.getString(555) + ": ");
         }
         else
         {
            this.detailstext.appendText(§1t1521s0§.getString(556) + ": ");
         }
         if(_loc3_ && this.§1t5914s0§ == 0 || !_loc3_ && this.§1t5914s0§ == 1)
         {
            §1t1523s0§.§1t9619s0§(this.bet * 2);
            this.detailstext.appendText(§1t1521s0§.getString(281));
         }
         else
         {
            this.detailstext.appendText(§1t1521s0§.getString(477));
            §1t3317s0§.instance.§1t1946s0§();
         }
         this.bet = 0;
         this.§1t5892s0§();
      }
      
      internal function §1t5916s0§(param1:int, param2:§1t58s0§) : *
      {
         if(!this.loading.visible)
         {
            return;
         }
         this.loading.visible = false;
         var _loc3_:int = §1t1525s0§.§1t9936s0§();
         if(_loc3_ > 80)
         {
            _loc3_ = 80;
         }
         param1 = _loc3_ * 100;
         if(§1t1523s0§.§1t9616s0§() < param1)
         {
            §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(88),§1t1521s0§.getString(5));
            §1t406s0§.instance.§1t6486s0§.§1t5486s0§();
            §1t88s0§.instance.§1t1516s0§("Snd_error");
            param2.destroy();
            return;
         }
         if(_loc3_ < 30)
         {
            if(§1t1523s0§.§1t9714s0§(20061) < 2)
            {
               §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(666),§1t1521s0§.getString(5));
               §1t406s0§.instance.§1t6486s0§.§1t5486s0§();
               §1t88s0§.instance.§1t1516s0§("Snd_error");
               param2.destroy();
               return;
            }
            §1t1523s0§.§1t9713s0§(20061,-2);
         }
         else if(_loc3_ < 60)
         {
            if(§1t1523s0§.§1t9714s0§(20062) == 0 || §1t1523s0§.§1t9714s0§(20063) < 2)
            {
               §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(666),§1t1521s0§.getString(5));
               §1t406s0§.instance.§1t6486s0§.§1t5486s0§();
               §1t88s0§.instance.§1t1516s0§("Snd_error");
               param2.destroy();
               return;
            }
            §1t1523s0§.§1t9713s0§(20062,-1);
            §1t1523s0§.§1t9713s0§(20063,-2);
         }
         else
         {
            if(§1t1523s0§.§1t9714s0§(20061) < 2 || §1t1523s0§.§1t9714s0§(20060) < 2 || §1t1523s0§.§1t9714s0§(20065) == 0)
            {
               §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(666),§1t1521s0§.getString(5));
               §1t406s0§.instance.§1t6486s0§.§1t5486s0§();
               §1t88s0§.instance.§1t1516s0§("Snd_error");
               param2.destroy();
               return;
            }
            §1t1523s0§.§1t9713s0§(20061,-2);
            §1t1523s0§.§1t9713s0§(20060,-2);
            §1t1523s0§.§1t9713s0§(20065,-1);
         }
         §1t1523s0§.§1t9619s0§(-param1);
         §1t3317s0§.instance.§1t1946s0§();
         this.hide();
         var _loc4_:§1t17s0§ = §1t406s0§.instance.§1t6488s0§.§1t6195s0§(_loc3_);
         _loc4_.§1t541s0§(§1t1523s0§.§1t9765s0§());
         §1t406s0§.instance.§1t6488s0§.§1t5826s0§();
         §1t406s0§.instance.§1t6488s0§.show();
         §1t1523s0§.§1t1684s0§(60020,1);
         param2.destroy();
      }
   }
}


package
{
   import flash.geom.Point;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3202")]
   public class §1t8587s0§ extends §1t399s0§
   {
      
      public var word:TextField;
      
      internal var dest:int;
      
      internal var destXPos:int = 150;
      
      internal var destNode:int = -1;
      
      internal var destName:String;
      
      internal var compassDir:int = -1;
      
      internal var apuse:int = 0;
      
      internal var territoryStr:String = "";
      
      public function §1t8587s0§(param1:String, param2:String = "")
      {
         var _loc6_:§1t5038s0§ = null;
         var _loc7_:Point = null;
         super();
         this.props = param1;
         if(param2 == "")
         {
            objectName = "Signpost";
         }
         else
         {
            objectName = param2;
         }
         var _loc3_:Array = param1.split(",");
         var _loc4_:int = int(_loc3_.length);
         this.dest = int(_loc3_[0]);
         if(_loc4_ >= 2)
         {
            this.destXPos = int(_loc3_[1]);
         }
         if(_loc4_ >= 3)
         {
            this.destNode = int(_loc3_[2]);
            this.destName = §1t1525s0§.§1t1382s0§(this.dest,this.destNode);
         }
         else
         {
            this.destName = §1t1525s0§.§1t1382s0§(this.dest,-1);
         }
         if(_loc4_ >= 4 && _loc3_[3] == "0")
         {
            visible = false;
         }
         if(_loc4_ >= 6)
         {
            this.compassDir = _loc3_[4];
            gotoAndStop(int(_loc3_[5]) + 2);
            if(this.compassDir == §1t70s0§.§1t9128s0§)
            {
               this.word.text = §1t1521s0§.getString(398);
            }
            else if(this.compassDir == §1t70s0§.§1t9129s0§)
            {
               this.word.text = §1t1521s0§.getString(399);
            }
            else if(this.compassDir == §1t70s0§.§1t9130s0§)
            {
               this.word.text = §1t1521s0§.getString(400);
            }
            else if(this.compassDir == §1t70s0§.§1t9131s0§)
            {
               this.word.text = §1t1521s0§.getString(401);
            }
            this.word.mouseEnabled = false;
         }
         else
         {
            gotoAndStop(1);
         }
         if(_loc4_ >= 7)
         {
            _loc6_ = new §1t5038s0§();
            addChild(_loc6_);
            if(_loc3_[6] == "1")
            {
               _loc6_.arrow.arrowtext.text = "";
            }
            else
            {
               _loc6_.arrow.arrowtext.text = §1t1521s0§.getString(_loc3_[6]);
            }
            _loc6_.x = 2;
            _loc6_.y = -130;
         }
         if(this.dest == -1 || this.dest == -2 || this.dest == -3)
         {
            §1t8503s0§ = §1t407s0§.§1t12446s0§;
         }
         else
         {
            §1t8503s0§ = §1t407s0§.§1t12439s0§;
         }
         var _loc5_:Point = §1t70s0§.instance.§1t1133s0§(§1t1525s0§.§1t9935s0§());
         if(§1t8503s0§ == §1t407s0§.§1t12439s0§ && this.destNode != -1)
         {
            _loc7_ = §1t70s0§.instance.§1t1133s0§(this.destNode);
            if(this.compassDir == -1 && !_loc5_.equals(_loc7_))
            {
               this.destName = §1t136s0§.§1t9190s0§().§1t1826s0§(_loc7_.x << 12 | _loc7_.y);
               this.territoryStr = " (" + (_loc7_.x - 341 + §1t7934s0§.§1t12538s0§) + "," + (_loc7_.y - 341 + §1t7934s0§.§1t12539s0§) + ")";
            }
         }
      }
      
      override public function needTransition() : Boolean
      {
         var _loc2_:§1t72s0§ = null;
         if(currentFrame != 1 && §1t1523s0§.§1t9480s0§)
         {
            return false;
         }
         if(!§1t1540s0§.§1t10047s0§() && §1t1523s0§.§1t9595s0§() > §1t1523s0§.§1t9603s0§() || this.apuse > 0 && §1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9414s0§) <= 0)
         {
            return false;
         }
         var _loc1_:Array = props.split(",");
         if(_loc1_.length >= 3)
         {
            if(this.destNode != §1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9420s0§))
            {
               _loc2_ = §1t1524s0§.§1t9886s0§(this.destNode);
               if(!§1t1523s0§.§1t640s0§(_loc2_.condition))
               {
                  return false;
               }
            }
         }
         return true;
      }
      
      override public function §1t8523s0§() : *
      {
         var _loc1_:int = 0;
         if(this.needTransition())
         {
            §1t406s0§.§1t9190s0§().§1t6496s0§.§1t6851s0§(this);
            §1t406s0§.§1t9190s0§().§1t6496s0§.§1t6848s0§(§1t6497s0§.§1t12442s0§);
         }
         else
         {
            this.interact();
            _loc1_ = §1t1525s0§.§1t9923s0§();
            if(!§1t3317s0§.instance.§1t1833s0§ && (_loc1_ == §1t134s0§.§1t9232s0§ || _loc1_ == §1t134s0§.§1t9233s0§ || _loc1_ == §1t134s0§.§1t9234s0§ || _loc1_ == §1t134s0§.§1t9236s0§ || _loc1_ == §1t134s0§.§1t9237s0§))
            {
               §1t406s0§.instance.§1t6496s0§.§1t5149s0§ = true;
               §1t1540s0§.§1t10035s0§(§1t1040s0§.§1t12376s0§);
            }
         }
      }
      
      override public function interact() : *
      {
         var _loc3_:§1t72s0§ = null;
         if(!§1t1540s0§.§1t10047s0§() && §1t1523s0§.§1t9595s0§() > §1t1523s0§.§1t9603s0§())
         {
            §1t88s0§.instance.§1t1516s0§("Snd_error");
            §1t406s0§.instance.§1t6534s0§(§1t1521s0§.getString(138),§1t1521s0§.getString(5));
            return;
         }
         if(!§1t1523s0§.§1t9606s0§(this.apuse))
         {
            §1t88s0§.instance.§1t1516s0§("Snd_error");
            §1t406s0§.instance.§1t6528s0§(§1t1521s0§.getString(100),§1t1521s0§.getString(5));
            return;
         }
         if(§1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9414s0§) == 0 && §1t1523s0§.§1t9714s0§(40001) == 0)
         {
            §1t406s0§.instance.§1t6528s0§(§1t1521s0§.getString(100),§1t1521s0§.getString(5));
         }
         var _loc1_:Array = props.split(",");
         var _loc2_:int = int(_loc1_.length);
         if(_loc2_ >= 3)
         {
            if(this.destNode != §1t1523s0§.§1t2218s0§())
            {
               _loc3_ = §1t1524s0§.§1t9886s0§(this.destNode);
               if(!§1t1523s0§.§1t640s0§(_loc3_.condition))
               {
                  §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(_loc3_.§1t1169s0§),§1t1521s0§.getString(5));
                  return;
               }
            }
            §1t1525s0§.§1t9922s0§(this.dest,this.destXPos,this.destNode,this.compassDir);
         }
         else if(_loc2_ == 2)
         {
            §1t1525s0§.§1t9922s0§(this.dest,this.destXPos);
         }
         else
         {
            §1t1525s0§.§1t9922s0§(this.dest);
         }
      }
      
      override public function §1t6733s0§() : String
      {
         var _loc1_:String = "";
         if(this.dest == -1 || this.dest == -3)
         {
            _loc1_ = §1t1521s0§.getString(193,[this.destName]);
         }
         else if(this.dest == -2)
         {
            _loc1_ = §1t1521s0§.getString(716);
         }
         else
         {
            _loc1_ = this.destName;
         }
         switch(this.compassDir)
         {
            case §1t70s0§.§1t9128s0§:
               _loc1_ += " (" + §1t1521s0§.getString(398) + ")";
               break;
            case §1t70s0§.§1t9129s0§:
               _loc1_ += " (" + §1t1521s0§.getString(399) + ")";
               break;
            case §1t70s0§.§1t9130s0§:
               _loc1_ += " (" + §1t1521s0§.getString(400) + ")";
               break;
            case §1t70s0§.§1t9131s0§:
               _loc1_ += " (" + §1t1521s0§.getString(401) + ")";
               break;
            default:
               _loc1_ += this.territoryStr;
         }
         return _loc1_;
      }
      
      override public function §1t8517s0§() : int
      {
         return this.apuse;
      }
   }
}


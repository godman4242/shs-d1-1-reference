package
{
   import flash.display.MovieClip;
   
   public class HexManager
   {
      
      public static var selectedHex:Hex;
      
      public static var instance:HexManager;
      
      public static var heroLocation:HexInfo;
      
      public static var isPlayerTurn:Boolean = true;
      
      public static var playerSelected:Boolean = false;
      
      public static var enemiesToFight:int = 0;
      
      internal static var maxCounter:* = 12;
      
      internal static var counter:* = maxCounter;
      
      internal static var engagedStrength:* = -1;
      
      public function HexManager()
      {
         super();
         instance = this;
      }
      
      public static function canMove(param1:Hex, param2:Hex) : Boolean
      {
         if(param1 == null || param2 == null)
         {
            return false;
         }
         if(param1.info.strength == 1)
         {
            return false;
         }
         if(param1.info.side == param2.info.side)
         {
            return false;
         }
         if(param1.getRow() == param2.getRow() && Math.abs(param1.getColumn() - param2.getColumn()) == 1)
         {
            return true;
         }
         if(param1.getRow() % 2 == 0 && Math.abs(param1.getRow() - param2.getRow()) == 1 && (param1.getColumn() == param2.getColumn() || param1.getColumn() == param2.getColumn() - 1))
         {
            return true;
         }
         if(param1.getRow() % 2 != 0 && Math.abs(param1.getRow() - param2.getRow()) == 1 && (param1.getColumn() == param2.getColumn() || param1.getColumn() == param2.getColumn() + 1))
         {
            return true;
         }
         return false;
      }
      
      public static function reinit() : *
      {
         selectedHex = null;
         counter = maxCounter;
      }
      
      public static function selectHex(param1:Hex) : *
      {
         if(isSurroundedByFriendly(param1) || param1.info.strength == 1)
         {
            return;
         }
         if(selectedHex != null)
         {
            selectedHex.unselect();
         }
         selectedHex = param1;
         param1.select();
      }
      
      public static function update() : *
      {
         if(StatsManager.instance.mission == 4)
         {
            if(!isPlayerTurn)
            {
               --counter;
               if(counter == 0)
               {
                  counter = maxCounter;
                  if(!enemyMove())
                  {
                     endEnemyTurn();
                  }
               }
            }
         }
      }
      
      public static function endEnemyTurn() : *
      {
         isPlayerTurn = true;
         StatsManager.instance.map.gui.words.text = "";
         ++StatsManager.instance.turn;
         StatsManager.instance.displayTurn();
         reinforceForces(3);
         StatsManager.instance.map.gui.endturnbutton.visible = true;
         trace("player moves");
         StatsManager.instance.updateStats();
         StatsManager.instance.saveData();
      }
      
      public static function enemyMove() : Boolean
      {
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         var _loc3_:Hex = null;
         _loc1_ = 0;
         while(_loc1_ <= 10)
         {
            _loc2_ = 0;
            while(_loc2_ <= 11)
            {
               _loc3_ = StatsManager.instance.map.hexgrid.getChildByName("hex_" + _loc1_ + "_" + _loc2_);
               if(_loc3_ != null && _loc3_.info.side == 3)
               {
                  if(individualEnemyMove(_loc3_))
                  {
                     return true;
                  }
               }
               _loc2_++;
            }
            _loc1_++;
         }
         return false;
      }
      
      internal static function isClear(param1:Hex) : Boolean
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:Hex = null;
         _loc2_ = param1.getRow() - 2;
         while(_loc2_ <= param1.getRow() + 2)
         {
            _loc3_ = param1.getColumn() - 2;
            while(_loc3_ <= param1.getColumn() + 2)
            {
               _loc4_ = StatsManager.instance.map.hexgrid.getChildByName("hex_" + _loc2_ + "_" + _loc3_);
               if(_loc4_ != null)
               {
                  if(_loc4_.info.side == 3 && _loc4_.info.strength > 1)
                  {
                     return false;
                  }
               }
               _loc3_++;
            }
            _loc2_++;
         }
         return true;
      }
      
      internal static function isNextToPlayer(param1:Hex) : Boolean
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:Hex = null;
         _loc2_ = param1.getRow() - 1;
         while(_loc2_ <= param1.getRow() + 1)
         {
            _loc3_ = param1.getColumn() - 1;
            while(_loc3_ <= param1.getColumn() + 1)
            {
               _loc4_ = StatsManager.instance.map.hexgrid.getChildByName("hex_" + _loc2_ + "_" + _loc3_);
               if(_loc4_ != null)
               {
                  if(_loc4_.info.hasPlayer)
                  {
                     return true;
                  }
               }
               _loc3_++;
            }
            _loc2_++;
         }
         return false;
      }
      
      public static function reinforceForces(param1:int) : *
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:Hex = null;
         var _loc5_:* = undefined;
         var _loc6_:* = undefined;
         _loc2_ = 0;
         while(_loc2_ <= 10)
         {
            _loc3_ = 0;
            while(_loc3_ <= 11)
            {
               _loc4_ = StatsManager.instance.map.hexgrid.getChildByName("hex_" + _loc2_ + "_" + _loc3_);
               if(_loc4_ != null && _loc4_.info.side == param1)
               {
                  _loc5_ = 4;
                  if(param1 == 3)
                  {
                     _loc5_ = 2;
                  }
                  _loc6_ = Math.random() * _loc5_;
                  if(_loc6_ != 0 && _loc4_.info.strength != 10)
                  {
                     _loc4_.reinforceanim.gotoAndPlay(2);
                  }
                  _loc4_.info.strength += _loc6_;
                  if(_loc4_.info.strength > 10)
                  {
                     _loc4_.info.strength = 10;
                  }
                  if(StatsManager.instance.hexCheat)
                  {
                     if(param1 == 2)
                     {
                        _loc4_.info.strength = 10;
                     }
                  }
                  _loc4_.updateDisplay();
               }
               _loc3_++;
            }
            _loc2_++;
         }
      }
      
      internal static function individualEnemyMove(param1:Hex) : Boolean
      {
         var _loc2_:Array = null;
         var _loc3_:Array = null;
         var _loc4_:Array = null;
         var _loc5_:Array = null;
         var _loc6_:int = 0;
         var _loc7_:* = undefined;
         _loc2_ = getOptions(param1);
         if(_loc2_.length == 0 || isNextToPlayer(param1))
         {
            return false;
         }
         _loc3_ = new Array();
         _loc4_ = new Array();
         _loc5_ = new Array();
         _loc7_ = 0;
         while(_loc7_ < _loc2_.length)
         {
            if(_loc2_[_loc7_].info.side == 1 || _loc2_[_loc7_].info.side == 2 && _loc2_[_loc7_].info.strength < param1.info.strength)
            {
               _loc5_.push(_loc2_[_loc7_]);
            }
            else if(_loc2_[_loc7_].info.side == 2 && _loc2_[_loc7_].info.strength == param1.info.strength)
            {
               _loc3_.push(_loc2_[_loc7_]);
            }
            else if(_loc2_[_loc7_].info.side == 2 && _loc2_[_loc7_].info.strength == param1.info.strength + 1)
            {
               _loc4_.push(_loc2_[_loc7_]);
            }
            _loc7_++;
         }
         if(param1.info.strength == 2)
         {
            if(isClear(param1))
            {
               trace("easy");
               _loc6_ = Math.random() * _loc5_.length;
               moveTo(param1,_loc5_[_loc6_]);
               return true;
            }
            return false;
         }
         if(_loc5_.length > 0)
         {
            trace("easy");
            _loc6_ = Math.random() * _loc5_.length;
            moveTo(param1,_loc5_[_loc6_]);
            return true;
         }
         if(_loc3_.length > 0)
         {
            trace("risky");
            _loc6_ = Math.random() * _loc3_.length;
            moveTo(param1,_loc3_[_loc6_]);
            return true;
         }
         if(_loc4_.length > 0)
         {
            if(Math.random() * 3 > 1)
            {
               return false;
            }
            trace("very risky");
            _loc6_ = Math.random() * _loc4_.length;
            moveTo(param1,_loc4_[_loc6_]);
            return true;
         }
         return false;
      }
      
      public static function died() : *
      {
         heroLocation.side = 3;
         heroLocation.strength = engagedStrength;
      }
      
      public static function winsFight(param1:Hex, param2:Hex) : *
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:* = undefined;
         if(param2.getRow() == 2 && param2.getColumn() == 5)
         {
            StatsManager.instance.map.gui.words.text = LangManager.getWords(7);
            return false;
         }
         if(StatsManager.instance.hexCheat)
         {
            if(param1.info.side == 2)
            {
               return true;
            }
            if(param2.info.side == 2)
            {
               return false;
            }
         }
         _loc3_ = 0;
         _loc4_ = 0;
         _loc6_ = 0;
         while(_loc6_ < param1.info.strength)
         {
            _loc5_ = Math.random() * 6 + 1;
            _loc3_ += _loc5_;
            _loc6_++;
         }
         _loc6_ = 0;
         while(_loc6_ < param2.info.strength)
         {
            _loc5_ = Math.random() * 6 + 1;
            _loc4_ += _loc5_;
            _loc6_++;
         }
         return _loc3_ >= _loc4_;
      }
      
      internal static function getOptions(param1:Hex) : Array
      {
         var _loc2_:Array = null;
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         var _loc5_:Hex = null;
         _loc2_ = new Array();
         _loc3_ = param1.getRow() - 1;
         while(_loc3_ <= param1.getRow() + 1)
         {
            _loc4_ = param1.getColumn() - 1;
            while(_loc4_ <= param1.getColumn() + 1)
            {
               _loc5_ = StatsManager.instance.map.hexgrid.getChildByName("hex_" + _loc3_ + "_" + _loc4_);
               if(_loc5_ != null && !_loc5_.info.hasPlayer && canMove(param1,_loc5_))
               {
                  _loc2_.push(_loc5_);
               }
               _loc4_++;
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      internal static function isSurroundedByFriendly(param1:Hex) : Boolean
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:Hex = null;
         _loc2_ = param1.getRow() - 1;
         while(_loc2_ <= param1.getRow() + 1)
         {
            _loc3_ = param1.getColumn() - 1;
            while(_loc3_ <= param1.getColumn() + 1)
            {
               _loc4_ = StatsManager.instance.map.hexgrid.getChildByName("hex_" + _loc2_ + "_" + _loc3_);
               if(_loc4_ != null)
               {
                  if(_loc4_.info.side != param1.info.side)
                  {
                     return false;
                  }
               }
               _loc3_++;
            }
            _loc2_++;
         }
         return true;
      }
      
      public static function moveTo(param1:Hex, param2:Hex) : *
      {
         if(param2.info.side == 1)
         {
            param2.info.side = param1.info.side;
            --param1.info.strength;
            param1.info.strength = 1;
            param1.updateDisplay();
            param2.updateDisplay();
            if(isPlayerTurn)
            {
               selectHex(param2);
            }
         }
         else if(param1.info.side != param2.info.side)
         {
            if(winsFight(param1,param2))
            {
               param2.info.side = param1.info.side;
               --param1.info.strength;
               param1.info.strength = 1;
               param1.updateDisplay();
               param2.updateDisplay();
               if(isPlayerTurn)
               {
                  selectHex(param2);
               }
            }
            else
            {
               param1.info.strength = 1;
               param1.updateDisplay();
            }
         }
      }
      
      public static function hexClick(param1:Hex) : *
      {
         if(!isPlayerTurn)
         {
            return;
         }
         if(playerSelected && playerCanMove(param1))
         {
            heroLocation.hasPlayer = false;
            heroLocation.getHex().updateDisplay();
            param1.info.hasPlayer = true;
            param1.updateDisplay();
            heroLocation = param1.info;
            if(param1.info.side == 2)
            {
               StatsManager.instance.map.gui.words.text = "";
            }
            if(!StatsManager.instance.banner3taken && heroLocation.row == 2 && heroLocation.column == 0)
            {
               StatsManager.instance.banner3taken = true;
               StatsManager.instance.map.newbanner3.visible = true;
               ++StatsManager.instance.totalBanners;
               StatsManager.instance.totalScore += 2000;
            }
            if(!StatsManager.instance.banner4taken && heroLocation.row == 0 && heroLocation.column == 8)
            {
               StatsManager.instance.banner4taken = true;
               StatsManager.instance.map.newbanner4.visible = true;
               ++StatsManager.instance.totalBanners;
               StatsManager.instance.totalScore += 2000;
            }
            if(!StatsManager.instance.banner5taken && heroLocation.row == 5 && heroLocation.column == 10)
            {
               StatsManager.instance.banner5taken = true;
               StatsManager.instance.map.newbanner5.visible = true;
               ++StatsManager.instance.totalBanners;
               StatsManager.instance.totalScore += 2000;
            }
            if(!StatsManager.instance.hexitemtaken && heroLocation.row == 0 && heroLocation.column == 0)
            {
               StatsManager.instance.hexitemtaken = true;
               StatsManager.instance.map.hexitem.visible = false;
               StatsManager.instance.getItem();
            }
            if(!StatsManager.instance.bossDefeated && heroLocation.row == 2 && heroLocation.column == 5 && heroLocation.side == 3)
            {
               StatsManager.instance.map.gui.words.text = LangManager.getWords(6);
            }
            return;
         }
         playerSelected = false;
         StatsManager.instance.map.hexplayer.selected.visible = false;
         if(selectedHex == null && param1.info.side != 2)
         {
            return;
         }
         if(selectedHex == null || selectedHex.info.side == param1.info.side)
         {
            selectHex(param1);
         }
         else if(canMove(selectedHex,param1))
         {
            moveTo(selectedHex,param1);
         }
      }
      
      public static function playerHexClick(param1:MovieClip) : *
      {
         if(!isPlayerTurn)
         {
            return;
         }
         playerSelected = !playerSelected;
         param1.selected.visible = playerSelected;
         if(selectedHex != null)
         {
            selectedHex.unselect();
            selectedHex = null;
         }
      }
      
      public static function playerCanMove(param1:Hex) : Boolean
      {
         var _loc2_:Hex = null;
         _loc2_ = heroLocation.getHex();
         if(_loc2_ == null || param1 == null)
         {
            return false;
         }
         if((_loc2_.info.side == 3 || _loc2_.info.side == 1) && (param1.info.side == 3 || param1.info.side == 1))
         {
            return false;
         }
         if(_loc2_.getRow() == param1.getRow() && Math.abs(_loc2_.getColumn() - param1.getColumn()) == 1)
         {
            return true;
         }
         if(_loc2_.getRow() % 2 == 0 && Math.abs(_loc2_.getRow() - param1.getRow()) == 1 && (_loc2_.getColumn() == param1.getColumn() || _loc2_.getColumn() == param1.getColumn() - 1))
         {
            return true;
         }
         if(_loc2_.getRow() % 2 != 0 && Math.abs(_loc2_.getRow() - param1.getRow()) == 1 && (_loc2_.getColumn() == param1.getColumn() || _loc2_.getColumn() == param1.getColumn() + 1))
         {
            return true;
         }
         return false;
      }
      
      public static function endPlayerTurn() : *
      {
         isPlayerTurn = false;
         StatsManager.instance.previousHp = StatsManager.instance.hp;
         StatsManager.instance.map.gui.endturnbutton.visible = false;
         StatsManager.instance.map.gui.words.text = "The enemy is on the move.";
         if(selectedHex != null)
         {
            selectedHex.unselect();
            selectedHex = null;
         }
         reinforceForces(2);
         if(heroLocation.side == 3)
         {
            enemiesToFight = heroLocation.strength;
            engagedStrength = heroLocation.strength;
            heroLocation.strength = 1;
            if(!StatsManager.instance.bossDefeated && heroLocation.row == 2 && heroLocation.column == 5 && heroLocation.side == 3)
            {
               StatsManager.instance.map.gui.bossdialog.gotoAndPlay(2);
            }
            else
            {
               heroLocation.side = 2;
               StatsManager.instance.location = 100;
               StatsManager.instance.map.transition.gotoAndPlay(25);
            }
         }
         else if(heroLocation.side == 1)
         {
            heroLocation.side = 2;
            heroLocation.strength = 1;
            heroLocation.getHex().updateDisplay();
         }
         else
         {
            trace("computer moves");
         }
      }
   }
}


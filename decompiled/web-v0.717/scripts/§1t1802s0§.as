package
{
   import com.newgrounds.*;
   
   public class §1t1802s0§
   {
      
      public static var instance:§1t1802s0§;
      
      public function §1t1802s0§()
      {
         super();
         instance = this;
      }
      
      public function init(param1:*) : *
      {
         API.connect(param1,§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9007s0§),§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9008s0§));
      }
      
      public function §1t1684s0§(param1:int, param2:int, param3:Boolean = false) : *
      {
         if(param1 == 60001)
         {
            API.postScore("Online Duels Won",1);
         }
      }
      
      public function §1t1803s0§() : *
      {
         var _loc1_:Array = §1t1524s0§.§1t9891s0§();
         var _loc2_:int = int(_loc1_.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(_loc1_[_loc3_] != 0 && !API.getMedal(this.§1t1804s0§(_loc3_)).unlocked)
            {
               this.unlockMedal(_loc3_);
            }
            _loc3_++;
         }
      }
      
      internal function §1t1804s0§(param1:int) : String
      {
         var _loc2_:String = "";
         if(param1 == 0)
         {
            _loc2_ = "Duelist I";
         }
         else if(param1 == 1)
         {
            _loc2_ = "Duelist II";
         }
         else if(param1 == 2)
         {
            _loc2_ = "Duelist III";
         }
         else if(param1 == 3)
         {
            _loc2_ = "Killer I";
         }
         else if(param1 == 4)
         {
            _loc2_ = "Killer II";
         }
         else if(param1 == 5)
         {
            _loc2_ = "Killer III";
         }
         else if(param1 == 6)
         {
            _loc2_ = "Eye of the Beheader I";
         }
         else if(param1 == 7)
         {
            _loc2_ = "Eye of the Beheader II";
         }
         else if(param1 == 8)
         {
            _loc2_ = "Eye of the Beheader III";
         }
         else if(param1 == 9)
         {
            _loc2_ = "Hot Potato I";
         }
         else if(param1 == 10)
         {
            _loc2_ = "Hot Potato II";
         }
         else if(param1 == 11)
         {
            _loc2_ = "Hot Potato III";
         }
         else if(param1 == 12)
         {
            _loc2_ = "Truffle Shuffle";
         }
         else if(param1 == 13)
         {
            _loc2_ = "Herbivore";
         }
         else if(param1 == 14)
         {
            _loc2_ = "Flower Power";
         }
         else if(param1 == 15)
         {
            _loc2_ = "Rock Collector";
         }
         else if(param1 == 16)
         {
            _loc2_ = "Curious George";
         }
         else if(param1 == 17)
         {
            _loc2_ = "Mr Smith";
         }
         else if(param1 == 18)
         {
            _loc2_ = "Fixer-Upper";
         }
         else if(param1 == 19)
         {
            _loc2_ = "Hard Hitter";
         }
         else if(param1 == 20)
         {
            _loc2_ = "Big Spender I";
         }
         else if(param1 == 21)
         {
            _loc2_ = "Big Spender II";
         }
         else if(param1 == 22)
         {
            _loc2_ = "Big Spender III";
         }
         else if(param1 == 23)
         {
            _loc2_ = "Philanthropist";
         }
         else if(param1 == 24)
         {
            _loc2_ = "Town Hero I";
         }
         else if(param1 == 25)
         {
            _loc2_ = "Town Hero II";
         }
         else if(param1 == 26)
         {
            _loc2_ = "Town Hero III";
         }
         else if(param1 == 27)
         {
            _loc2_ = "Bounty Hunter I";
         }
         else if(param1 == 28)
         {
            _loc2_ = "Bounty Hunter II";
         }
         else if(param1 == 29)
         {
            _loc2_ = "Bounty Hunter III";
         }
         else if(param1 == 30)
         {
            _loc2_ = "It\'s a Trap I";
         }
         else if(param1 == 31)
         {
            _loc2_ = "It\'s a Trap II";
         }
         else if(param1 == 32)
         {
            _loc2_ = "It\'s a Trap III";
         }
         else if(param1 == 33)
         {
            _loc2_ = "Prize Collector I";
         }
         else if(param1 == 34)
         {
            _loc2_ = "Prize Collector II";
         }
         else if(param1 == 35)
         {
            _loc2_ = "Prize Collector III";
         }
         else if(param1 == 36)
         {
            _loc2_ = "Fully Equipped";
         }
         else if(param1 == 37)
         {
            _loc2_ = "Strong Back";
         }
         else if(param1 == 38)
         {
            _loc2_ = "Big Pockets";
         }
         else if(param1 == 39)
         {
            _loc2_ = "Old MacDonald";
         }
         else if(param1 == 40)
         {
            _loc2_ = "Eagle Eyes";
         }
         else if(param1 == 41)
         {
            _loc2_ = "Heigh-Ho!";
         }
         else if(param1 == 42)
         {
            _loc2_ = "Light Stance Master";
         }
         else if(param1 == 43)
         {
            _loc2_ = "Balanced Stance Master";
         }
         else if(param1 == 44)
         {
            _loc2_ = "Heavy Stance Master";
         }
         else if(param1 == 45)
         {
            _loc2_ = "Chi Master";
         }
         else if(param1 == 46)
         {
            _loc2_ = "Ninja Master";
         }
         else if(param1 == 47)
         {
            _loc2_ = "Red Slayer";
         }
         else if(param1 == 48)
         {
            _loc2_ = "Rebirth";
         }
         else if(param1 == 49)
         {
            _loc2_ = "Renshi";
         }
         else if(param1 == 50)
         {
            _loc2_ = "Kyoshi";
         }
         else if(param1 == 51)
         {
            _loc2_ = "Ultimate Warrior";
         }
         else if(param1 == 52)
         {
            _loc2_ = "Recruit";
         }
         else if(param1 == 53)
         {
            _loc2_ = "Officer";
         }
         else if(param1 == 54)
         {
            _loc2_ = "General";
         }
         else if(param1 == 55)
         {
            _loc2_ = "War Hero";
         }
         else if(param1 == 56)
         {
            _loc2_ = "Warrior I";
         }
         else if(param1 == 57)
         {
            _loc2_ = "Warrior II";
         }
         else if(param1 == 58)
         {
            _loc2_ = "Warrior III";
         }
         else if(param1 == 59)
         {
            _loc2_ = "Salesman of the Year";
         }
         else if(param1 == 60)
         {
            _loc2_ = "Be Awesome";
         }
         return _loc2_;
      }
      
      public function unlockMedal(param1:int) : *
      {
         var _loc2_:String = this.§1t1804s0§(param1);
         if(_loc2_ != "")
         {
            API.unlockMedal(_loc2_);
         }
      }
   }
}

